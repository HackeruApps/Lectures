////: Playground - noun: a place where people can play
//
import UIKit
//
//////declare variables with var
//////swift is Type safe
////
//////
////////Swift uses Type inference:
//////var str = "Hello, playground"
//////str = "10"
//////
//////var num = 10
//////
//////print("Hello")
////////String, Int, UInt (Unsigned integer)
////////Character
//////
////////java keyword final
////////const
//////let x = 10
////////x = 11 does not compile
//////
//////
////////print is a global function
//////print("Hi")
////
////
////
////let width = 100
////
//////print("The width is: " + "100" + "cm")
////
////
//////how to convert int to String in swift?!
////
////
//////new String
////print("Width: " +  String(width))
////
//////String Interpolation:
////print("The width is: \(width) cm")
////
////
//////type conversion from Int to String!
////let widthString = String(width)
////
////
////let btn = UIButton() //no new
////
//////full unicode support
////let 💩 = "booboo"
////print(💩)
////
////let p = 10 * 10
//
////prefer let over var (always)
//
////define a const called 😺 and assign the value of "🐩" to cat
////print the 😺
//
//
////calculate a tip:
////define a const called bill = 200.0
//
////define a const called tipPercent = //15%
//
////calculate the tip amount
////calculate the tip + bill
//
////print a nice output:
//
//let 👩🏻‍💼 = "♥️"
//print(👩🏻‍💼)
//
//
//let tip = 0.15//15.0 / 100
//
//let bill = 200
//
//let tipAmount = tip * Double(bill)
//
//let totalAmount = Double(bill) + tipAmount
//
//print("The Bill Amount: \(bill) \n The tip is: \(tipAmount)\n Total: \(totalAmount)")
//
//
//
////Type Annotation:
//let a:String = "a"
//let aChar:Character = "🤡"
//
//let b:Bool = true //false
//
////String, Bool, Double ,Int, Character
////Optionals!!!
////Optionals solve the NullPointerExcpetion //90% of the errors
//
///*
//var x = 10
//x = 11
////Does not compilex = nil //
//*/
//
////Optional:
//var x:Int? = 10
//
////Optional Binding:
////if x has a value -> define a new const = x
//if let y = x{
//    //inside the block: x is UNWRAPPED
//    print(y)
//}
//
////define a VARIABLE named userName

//var userName:String?
//////assign a value to userName
//userName = nil
//
//////print Hello, userName
//if let userName = userName{
//    print("Hello, \(userName)")
//}else{
//    print("Hello, Stranger...")
//}



////change userName = nil
////if we have a user -> Hello, Booboo
////else{
////Hello, There...
////}




//var name:String?
////Optional Binding:
//if let name = name{
//    print(name)
//}

//String can't be nil

//String? can be nil, must handle-> No Crashes

//String! can be nil, crashes? yeah!

var foreceUnwrapped:String! = "Hello"

foreceUnwrapped = nil

//bad code...
//print(foreceUnwrapped.count)

var userName:String?
userName = "Moshe"

//force unwrap:
print(userName!)



//flow control?
//loops, if
let g = 10

if g == 10 {
    print("Cool")
}


//let grade = ...
let grade = 100


if grade > 100 || grade < 0{
    print("Not in range")
}
else if grade == 100{
    print("A+")
}
else if grade > 90{
   print("A") //90-100
}else if grade > 80{
    print("B")
}
else if grade > 70{
    print("C")
}else if grade > 60{
    print("D")
}else{
    print("F")
}
//0-60 F
//60 - 70 - d
//70 - 80 - c
//80 - 90 - b
//90 - 100 - A
//100 - A+












//don't need break...
//more readable
switch grade {
case 100:
    print("A+")
case 90..<100:
    print("B")
default:
    print("Not A+")
}

//... range operator
//..<



let char:Character = "d"
switch char {
case "a"..."z":
    print("lower")
default:
    print("not lower")
}

//b B
switch char {
case "B":
    print("B")
    fallthrough
case "b":
    print("The Letter b")
default:
    //Switch must be exhaustive
    print("")
}


//"RED", "GREEN", "BLUE"

let color = "RED"

switch color {
case "RED", "GREEN", "BLUE":
    print("RGB")
default:
    print("no such color")
}




//fori
for i in 0...5 {
    print(i)
}

for i in 0..<5 {
    print(i)
}




let arr = [1, 2, 10, 11, -1]
var sum = 0
for item in arr{
    sum += item
}
print("The Avarage is: \(Double(sum) / Double(arr.count))")
//avg:
//TODO: arr.count







//Array:
var numbers = [1, 1, 2, 3, 5, 8, 13]

//calculate the next number -> into numbers
//numbers[i]
numbers.append(
    numbers[numbers.count - 1]
        +
    numbers[numbers.count - 2]
)


//append
//count
//remove


let options:[Int] = [1, 10, 100]
//options.append(1000)


let days:[Int:String] = [1 : "Sunday", 2: "Monday"]

//[Any: Object]

var names:[String] = []//new String Array!
var names2 = [String]()
var names3 = Array<String>()
//Array enumaration:
//fill the names array with 3 names.
//print (1) Avraham
//      (2) Bar
//      (3) Chico
names.append("Avraham")
names.append("Bar")
names.append("Chico")
for i in 0..<names.count{
    print("\(i + 1) \(names[i])")
}
// names.enumerated()
//a nicer version
for (i, name) in names.enumerated(){
    print("(\(i + 1)) \(name)")
}




//... ...
var dict1 = [String: String]()
var dict2:[String:String] = [:]
var dict3 = Dictionary<String, String>()

//dict1: animal, diet
//add 3 animals to dict1
//print the dictionary
dict1["Cow"] = "Grass"
dict1["Dog"] = "Cat"
dict1["Cat"] = "Mouse"

for (a, f) in dict1{
    print("\(a) eats \(f)")
}


//dict
dict1["Cat"] = "Cat Food"







//יש להגריל בדיוק 3 מספרים שונים בין 1 ל-10

//SET<>


//איך נגריל מס'?
//let num = Int(arc4random_uniform(UInt32(3)))


for i in 1...10{
    let num = Int(arc4random_uniform(UInt32(3)))
    print(num)
}	









