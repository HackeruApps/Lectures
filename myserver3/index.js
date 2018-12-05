//~import
const express = require('express')
//body parser: parse the body
const bodyParser = require('body-parser')

//import
const { Pool } = require('pg')
/*
const pool = new Pool(
    
    {
    user: 'hrjqnjrqrxdhhb',
    host: 'ec2-23-21-65-173.compute-1.amazonaws.com',
    database: 'd86epp3f2d28jo',
    password: 'daa7e22a3446044c40aa0646a56434ade90358d19a585d4d7ab1c10a02ad848f',
    port: 5432,
}

)
*/
//safer
const pool = Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: true
})
//new app
const app = express()
//middleware: 
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

//application programing interface (REST Json API)

//Number
const port = process.env.PORT || 3000

//GET -> send the parameters in the URL
//POST -> send the parameters in the Body //https
app.post('/students/add', function (req, res) {
    let studnet = req.body
    
    const sql = `INSERT INTO students(firstname, lastname)
                VALUES($1, $2)`


    const args = [studnet.firstName, studnet.lastName]

    console.log(studnet)
    pool.query(sql, args, (err, dbRes)=>{
        if (dbRes){
            res.json({"success": true})
        }else if(err){
            res.json(err)
        }
    }) 
})

app.get('/students', function (req, res) {
    const sql = `SELECT * FROM Students`

    const args = []
    pool.query(sql, args, (err, dbRes)=>{
        if (dbRes){
            res.json(dbRes.rows)
        }else if(err){
            res.json(err)
        }
    }) 
})

//CREATE The tables (ONCE)
app.get("/init", function(req, res){
    const sql = `
    CREATE TABLE students(
        id SERIAL,
        firstname TEXT,
        lastname TEXT
    )`

    const args = []
    pool.query(sql, args, (err, dbRes)=>{
        if (dbRes){
            res.json(dbRes)
        }else if(err){
            res.json(err)
        }
    })   
})
 
app.listen(port, () => {
    console.log(`app listening on port ${port}`)
})