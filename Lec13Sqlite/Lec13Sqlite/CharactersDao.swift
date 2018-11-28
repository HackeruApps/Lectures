import UIKit
import SQLite3


class CharactersDao{
    
    //singleton:
    private init(){} //no instances from outside the class

    static let shared = CharactersDao()
    
    
    let updateString = """
                        UPDATE characters
                        SET firstName = ?,
                            lastName = ?,
                            serialNumber = ?,
                        WHERE id = ?
                        """
    
    
    let deleteString = """
                        DELETE FROM characters
                        WHERE id = ?

    """
    
    let createTableString = """
                        CREATE TABLE characters(id INTEGER PRIMARY KEY AUTOINCREMENT,
                                                firstName TEXT NOT NULL,
                                                lastName TEXT NOT NULL,
                                                serialNumber INTEGER
                                               )
                      """
    
    let dropTableString = "DROP TABLE characters"
    
    //prepared Statment: ? are placeholders (we bind data to ?)
    let insertString = """
                            INSERT INTO characters(firstName, lastName, serialNumber)
                            VALUES(?, ?, ?)
                       """
    
    let selectString = "SELECT * FROM characters;"
    //use prepared stement
    func selectCharacter(){
        var stmt:OpaquePointer? = nil
        if sqlite3_prepare_v2(db, selectString, -1, &stmt, nil) == SQLITE_OK{
            //use the stmt
            while sqlite3_step(stmt) == SQLITE_ROW{
                //0 based
                let id = sqlite3_column_int(stmt, 0) //Int32
                let name = String(cString: sqlite3_column_text(stmt, 1))
                let last = String(cString: sqlite3_column_text(stmt, 2))
                let serial = sqlite3_column_int(stmt, 3)
                
                print(id, name, last, serial)
            }
        }else{
            print("Could not prepare")
        }
    }
    
    //var args    query(sql, s, s, s ,1)
    private func preparedStatment(sql:String, args: Any...){
        var ps:OpaquePointer? = nil
        //convert the insertString to a prepared statement
        if sqlite3_prepare_v2(db, sql,-1, &ps, nil) == SQLITE_OK{
            for (i, arg) in args.enumerated(){
                if let arg = arg as? Int{
                    sqlite3_bind_int(ps, Int32(i + 1) , Int32(arg))
                }
                if let arg = arg as? String{
                    let str = arg as NSString
                    sqlite3_bind_text(ps, Int32(i + 1) ,str.utf8String, -1, nil)
                }
            }
            //use the statement
            if sqlite3_step(ps) != SQLITE_DONE{
                fatalError("Error in param Binding")
            }
        }else{
            fatalError("Can't prepare statememnt")
        }
        sqlite3_finalize(ps)
    }
    
    
    func insert(){
        preparedStatment(sql: insertString, args: 1, "Ned", "Stark")
    }
    
    func insert(characters: Characters){
        preparedStatment(sql: insertString,
                            args: characters.serialNumber,    characters.firstName, characters.lastName)
    }
    
    private var db = openDatabase()
    
    
    private func execSql(sql:String){
        if  sqlite3_exec(db, sql, nil, nil, nil) != SQLITE_OK {
            let errMessage = sqlite3_errmsg(db)
            let errString = String(cString: errMessage!)
            fatalError(errString)
        }
    }
    
    func createTable(){
       execSql(sql: createTableString)
    }
    
    func dropTable(){
       execSql(sql: dropTableString)
    }
    
    
    private static func openDatabase()->OpaquePointer?{
        //new file->app dirs
        let fm = FileManager.default
        let documents = fm.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let dbPath = documents.absoluteString + "mydb"
        fm.createFile(atPath: dbPath, contents: Data(), attributes: nil)
        
        var db:OpaquePointer? = nil
        
        if(sqlite3_open(dbPath, &db) == SQLITE_OK){
            print("DB is open")
            return db
        }else{
            fatalError("Can't open data base, did you create the file?")
        }
    }
}
