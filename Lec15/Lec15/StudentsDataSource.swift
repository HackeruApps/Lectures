
import Foundation
class StudentsDataSource{
    func addStudent(student: Student){
        let url = URL(string: "https://oron2.herokuapp.com/students/add")!
        
        let json = try! JSONEncoder.init().encode(student)
        
        //request method = POST, http body , json
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = json

        URLSession.shared.dataTask(with: request) { (data, res, err) in
            if let data = data {
                let r = String(data: data, encoding: String.Encoding.utf8)
                print(r ?? "empty")
            }
        }.resume()
    }
}
