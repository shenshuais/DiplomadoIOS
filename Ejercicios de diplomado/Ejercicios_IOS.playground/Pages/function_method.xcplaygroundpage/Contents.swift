//: [Previous](@previous)

import Foundation

//var greeting = "Hello, playground"
//
//func myAwsomePrintingFunction() {
//    print("Hello, World!")
//}
//
//myAwsomePrintingFunction()


func myAwsomePrintingFunction(name: String) {
    print("Hello, \(name)! Welcome to the class")
}
myAwsomePrintingFunction(name: "Shuai")

func add(lhs: Int, rhs: Int){
    print("\(lhs) + \(rhs) = \(lhs + rhs)")
}

add(lhs: 2, rhs: 2)

// parametro to es para uso externo de la función y name es para uso interno
func printWelcomeMessage(to name: String, course: String = "Diplomado IOS"){
    print("Hello \(name), welcome to \(course)")
}

printWelcomeMessage(to: "Shuai", course: "Diplomado IOS")
printWelcomeMessage(to: "Shuai")

// parametro inout, la función modifica la variable error si modifica errorString

//var error =  "The process failed"
//
//func appendErrorCode(code: Int, toErrorString errorString: inout String){
//    if code == 400{
//        errorString += "bad request"
//    }
//}
//
//print(error)
//appendErrorCode(code: 400, toErrorString: &error)
//print(error)

var error =  "The process failed"

func appendErrorCode(_ code: Int, toErrorString errorString: inout String){
    if code == 400{
        errorString += "bad request"
    }
}

print(error)
appendErrorCode(400, toErrorString: &error)
print(error)

// si solo es una linea se puede omitir return
func welcomeMessage(to name: String) -> String{
    return "Welcome \(name)"
}

let message = welcomeMessage(to: "Alejandro")
print(message)

func welcomeMessage2(to name: String) -> String{
    return "Welcome \(name)"
}
print(welcomeMessage2(to: "Shuai"))

// si la función esta dentro de un tipo dato, se convierte en un metodo
// función anidada

// Scope
func areaOfTriangleWidth(base: Double, height: Double) -> Double{
    let rectangle = base * height
    
    func divide() -> Double{
        return rectangle/2
    }
    
    return divide()
    
}

print(areaOfTriangleWidth(base: 2, height: 5))


func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]){
    
    var evens = [Int]() // initialize empty array
    var odds = [Int]()
    
    for number in numbers {
        if number % 2 == 0{
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    
    return (evens: evens, odds: odds)
}
let numbers = [10,1,4,5,47,2,12]
let EvenOddNumbers = sortedEvenOddNumbers(numbers)
print(EvenOddNumbers.evens)

//
func grabMiddleName(fullName name: (first: String, middle: String?, last: String)) -> String?{
    
    
    return name.middle
}

let middleName = grabMiddleName(fullName: (first: "Shuai", middle: nil, last: "Shen"))
// print(middleName)

// no imprime nada por nil
if let middleName = middleName {
    print(middleName)
}

// terminar antes una función

func greetByMiddleName(FullName name: (first: String, middle: String?, last: String), age: Int) {
    
    // si la funcion de guard cumple, continua y si no ejecuta lo que hay dentro de else
    guard let middle = name.middle, age > 18 else{
        print("Hey, there")
        return
    }
    
    print("Hey, \(middle)")
}

greetByMiddleName(FullName: (first: "Shuai", middle: nil, last: "Shen"), age: 19)
greetByMiddleName(FullName: (first: "Shuai", middle: "Mo", last: "Shen"), age: 19)

// las funciones tiene un tipo y es el tipo de dato que recibe -> el tipo de

func sortedEvenOddNumbers2(_ numbers: [Int]) -> (evens: [Int], odds: [Int]){
    
    return (evens: [], odds: [])
}

let myFunction: ([Int]) -> ([Int], [Int]) = sortedEvenOddNumbers2
let numbers2 = [1,2,3,4,5,6]
myFunction(numbers2)

//: [Next](@next)

var name  = "Shuai"
print(name.count)
