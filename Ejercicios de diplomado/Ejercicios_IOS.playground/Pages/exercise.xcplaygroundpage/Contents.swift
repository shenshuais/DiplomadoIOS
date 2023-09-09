//: [Previous](@previous)

import Foundation

var estado = 0
var dado = 0
var counter = 0

while estado < 24{
    print("paso \(counter):")
    dado = Int.random(in: 1...6)
    estado += dado
    
    // conditiones de escalera y serpientes
    if estado == 2 {
        estado = 10
    }
    if estado == 5 {
        estado = 16
    }
    if estado == 8{
        estado = 17
    }
    if estado == 9{
        estado = 11
    }
    // serpientes
    if estado == 13{
        estado = 3
    }
    if estado == 18{
        estado = 7
    }
    if estado == 21{
        estado = 10
    }
    if estado == 23{
        15
    }
    
    print("dado: \(dado), estado: \(estado)")
    counter += 1
    print("\n")
}



//: [Next](@next)
