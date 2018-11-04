
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let dict = Dictionary<String, String>()
        //let d1 = ["A":"3"]
        
        //print 52 cards:
        let ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
        
        let suits = ["♦️", "♠️", "♣️", "♥️"]
        
        
        var deck = [String]() //empty
        
        for rank in ranks{
          for suit in suits{
              //print("\(rank) of \(suit)")
                deck.append("\(rank) of \(suit)")
          }
        }
        
        var deck2 = [String]() //empty

        for _ in 0...51{
            let r = rand(max: deck.count)
            let c = deck.remove(at: r)
            deck2.append(c)
        }
        //print newArray
        print(deck2)
        //5) for...
        
    }
}

        
        
        
        
        
//
//        let randRank = ranks[rand(max: ranks.count)]
//        let randSuit = suits[rand(max: suits.count)]
//
//        print("\(randRank) of \(randSuit)")

        //TODO: Dictionary
//        let dict = ["Jack": 11, "Queen": 12, "King": 13]
//
//        if let t = dict["Jack"]{
//            print(t)
//        }
        

    //להגדיר פעולה שתגריל מס' רנדומלי בין 0 למספר שקיבלנו כפרמטר
    //הפעולה תחזיר מספר שלם ותקבל מספר שלם
    
    
    
    
/*
--   0 to max
rand(max:Int) ->Int
     
rand(from, to) ->Int
*/
//
//    func rand(max: Int)->Int{
//        let r = arc4random_uniform(UInt32(max))
//        return Int(r)
//        //return Int(arc4random_uniform(UInt32(max)))
//    }
//
//    func rand(maxInclusive: Int)->Int{
//        let r = arc4random_uniform(UInt32(maxInclusive))
//        return Int(r) + 1
//        //return Int(arc4random_uniform(UInt32(max)))
//    }
//
//
//    func rand(from: Int, to: Int) -> Int {
//        let r = rand(max: to - from)
//        return from + r
//    }
//
//    //Default Value
//    func sayHello(name:String = "Stranger...")  {
//        print("Hello, \(name)")
//    }
//
//
//    func greet(greet: String = "Hello, ", name:String = "Stranger...")  {
//        print("Hello, \(name)")
//    }
    //name
    //hello, name
    //()
    //Aloha,
    
    
    /*
     
     
     1) הגדירו מערך שמכיל את כל הציורים שיש על קלף משחק
     "♥️", "♣️♠️♦️
     
     2)
     מערך שמכיל את כל הדרגות שיש לקלפי משחק רגילים
     2, 3, 4, 5, 6, ... Jack, Queen, ...
    
     //3) כתבו פעולה שמגרילה קלף רנדומלי
     
     
     */
    
    
    
    
    
    
//
//    func print1(_ arg: String){
//        print(arg)
//    }
//
//    //method (in a class)
//    func sayHello(to name:String){
//        print("Hello, \(name)")
//    }
//
//    //Int x,y, width, height
//    func draw(x:Int, y:Int, width: Int, height: Int){
//        print("⬛️")
//    }
//}
//
////print add (3, 4) view did load
//func add(x: Int, y: Int)->Int{
//    return x + y
//}
//

    /*
func mivne(){

     //dict, Set = מאוד מאוד יעיל בחיפוש
     //אין חשיבות לסדר האיברים
     //let dict = ["a": "22", "b": "23" , "tommm": "24"]
     
     //print(dict)
     
     var set = Set<Int>()
     
     while set.count < 3 {
     let r = Int(arc4random_uniform(3)) //UInt32
     set.insert(r)
     }
     
     //print(set)
     
     
     //חיתוך  =intersection
     let s1:Set = ["A", "B"]
     let s2:Set = ["B", "C"]
     
     let intersect = s1.intersection(s2)
     print("Intersection: \(intersect)")
     
     //הפרש בין קבוצות - חיסור - substact
     
     let subs = s1.subtracting(s2)
     print("Substraction: \(subs)")
     
     //union - איחוד
     let union = s1.union(s2)
     print("Union: \(union)")
     
     //הפרש סימטרי
     let symDif = s1.symmetricDifference(s2)
     print("symmetricDifference: \(symDif)")
     
     
     //back to an array:
     let finalResult = Array(union).sorted()
     print("Final Result: \(finalResult)")
     
     
     let odd:Set = [1, 3, 5, 7, 9] //Set
     let even:Set = [0, 2, 4, 6, 8]
     let prime:Set = [2, 3, 5, 7]
     
     //חיסור בין הקבוצה הראשונה לשלישית
     איחוד בין הקבוצה הראשונה לשנייה
     הפרש סימטרי בין הקבוצה השנייה לבין השלישית
     למצוא את המשותף לקבוצה הראשונה והשלישית
     
     
     
     let a = odd.subtracting(prime)
     print("A) \(a)")
     
     let b = odd.union(even)
     print("B) \(b)")
     
     let c = even.symmetricDifference(prime)
     print("c) \(c)")
     
     let d = odd.intersection(prime)
     print("d) \(d)")
     
     
     //Dictionary<String, String>
     let days = ["Sunday": "ראשון", "Monday": "שני"]
     
     //Set
     let keys = Array(days.keys)
     print("keys: \(keys)")
     
     //Set
     let values = Array(days.values)
     print("Values: \(values)")
     
     //How to copy an array?
     let x = [1, 2, 3, 4 ,5]
     
     let y = x //copy x??
     
     */
