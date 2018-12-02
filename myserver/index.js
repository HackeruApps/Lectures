let express = require('express')
let app = express()
//variable array of objects
let todos = [
    {
        'id': 1,
        'title': 'Call mom',
        'todoDescription': 'Important!'
    },
    {
        'id': 2,
        'title': 'Call Dad',
        'todoDescription': 'Bla Bla'
    },
]
app.get('/todos', function (req, res) {
    //res.setHeader('content-type:application/json')
    res.json(todos)
})


//Server route:
app.get('/', function (req, res) {
    res.send('<h1>hello, world</h1>')
})

app.post('/todoForm', function(req, res){
    console.log(req)
    res.send('Happy Hannuka')
})


app.get('/todoForm', function (req, res) {
    let form =
    `<form method="POST">
        <input type="text" name="title" placeholder="title...">
        <input type="text" name="description" placeholder="description...">
        <input type="submit" value="save!">
    </form>`
    res.send(form)
})

//json
//host this server
//sql
//time permits: html


  
 
app.listen(3000)