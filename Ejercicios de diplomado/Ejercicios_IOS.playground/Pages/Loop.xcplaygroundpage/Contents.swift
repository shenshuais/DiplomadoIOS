//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

// for
for i in 1...5{
    print(i)
}

let numbers = [1,3,5,7]
for number in numbers {
    print(number)
}

let intervals = stride(from: 0, to: 20, by:5)
for interval in intervals{
    print(interval)
}

let pokemon = ["Fire":"Charmander","water":"Mudkip" ]
for (type, name) in pokemon {
    print ("\(name) of \(type)")
}
for poke in pokemon{
    print("\(poke.value) of \(poke.key)")
}

var indice = 0
for _ in pokemon{
    print(indice)
    indice += 1
}

let names = ["Shuai", "Shen", "Blanca"]
for (indice, name) in names.enumerated(){
    print(indice, name)
}

for (indice, poke) in pokemon.enumerated(){
    print(indice, poke.key, poke.value)
}

for (index, name) in names.enumerated(){
    if index % 2 == 0{
        print(index, name)
    } else {
        break
    }
}

print("\n\n\n")
for (index, name) in names.enumerated(){
    if index % 2 == 0{
        continue
    }
    print(index, name)
    
}

print("\n\n\n")
for (indice, name) in names.enumerated() where indice % 2 == 0{
    print(indice, name)
}
//: [Next](@next)

