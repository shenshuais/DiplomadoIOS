//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

// emumeladores, grupo de valores relacionados entre si, no es necesario inicializar todos

enum Pet: String {
    case dog = "🐶"
    case cat = "🐱"
}

let myPet = Pet(rawValue: "🥹")
let myDog: Pet = .dog
let myCat = Pet.cat

switch myPet {
case .dog: print("🐶")
case .cat: print("🐱")
default: print(myPet?.rawValue ?? Pet.cat.rawValue)
}



//: [Next](@next)
