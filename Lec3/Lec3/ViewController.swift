import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let q = Question(question: "1 + 1 = ?",
                         answers: ["10", "11", "01", "2"],
                         correctAns: "2",
                         category: .Sport
        )
        
        print(q.checkAns(ans: 4))

    }
    
    func structsVsClasses(){
        var pStruct = Person(firstName: "Aba", lastName: "Daba")
        var pClass = Person1(firstName: "Fania", lastName: "Bergshtein")
        
        
        var classCopy = pClass //pointer
        classCopy.firstName = "Changed!!!"
        
        
        print(pClass.firstName)
        print(classCopy.firstName)
        
        
        var structCopy = pStruct //Copy!!!
        structCopy.firstName = "Changed!!!"
        
        print(pStruct.firstName)
        print(structCopy.firstName)
    }
    
    func part1(){
        
        
        //Rank()
        let r:Rank? = Rank(rawValue: 11)
        
        //one-liners
       // print(r?.getDescription() ?? "No Card")
        
        //? elvis operator
       // let desc:String? = r?.getDescription()
        //print(desc ?? "No Card") //?? nil coallescing operator
        
        
        //optional binding
        if let r = r{
          //  print(r.getDescription())
        }
        
        
        let newRank = Rank(rawValue: 10)
        
        //force unwrap: !
      //  print(newRank!.getDescription())
    }
}






