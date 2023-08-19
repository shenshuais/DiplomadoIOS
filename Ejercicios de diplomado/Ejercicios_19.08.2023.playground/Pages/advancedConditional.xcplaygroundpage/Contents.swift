//: [Previous](@previous)

import Foundation

let animal = "dog"

// switch
switch animal {
case "dog":
    print("It's a 🐶")
default:
    break
}

// compounded cases
switch animal {
case "dog", "cat":
    print("It's a 🐶 or 🐈")
default:
    break
}

// close ranged operator
let grade = 9
switch grade {
case ...6 :
    print("Failed")
case 6... :
    print("Passed")
default:
    break
}

// fallthrough: move on the next case without validate the condition
var color = (255,255,255)
switch color {
case (_, _, 255):
    print("Max blue")
    fallthrough
case (_, 1, _): print("Max green")
default: break
}

//value vating

switch color {
case (let r, let g, 255):
    print("red: \(r), green: \(g), Max blue")
case (_, 255, _): print("Max green")
default: break
}

//where
color = (255,255,1)
switch color {
case (let r, let g, 255):
    print("red: \(r), green: \(g), Max blue")
case let (r, 255, b) where r >= 255:
    print("max red, max green, blue: \(b)")
case (_, 255, _): print("Max green")
default: break
}

//exercise
let positive = 1...5
let negative = -5 ... -1
var coordenada = (1,-1)

switch coordenada{
case let(x,y) where positive ~= x && positive ~= y : print("cuadrante 1")
case let(x,y) where negative ~= x && positive ~= y : print("cuadrante 2")
case let(x,y) where negative ~= x && negative ~= y : print("cuadrante 3")
case let(x,y) where positive ~= x && negative ~= y : print("cuadrante 4")
case let(x,y) where x == 0 && y != 0: print("eje y")
case let(x,y) where x != 0 && y==0: print("eje x")
case let(x,y) where x == 0 && y == 0: print("origen")
default: break
}

// guard

var number = 2
guard number == 2 else {
    fatalError("It's not a 2")
}

//: [Next](@next)
