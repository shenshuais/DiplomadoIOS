//: [Previous](@previous)

import Foundation

//optional null = nil

var cellphone: String = "5518944749"
var landline: String? = nil

print(cellphone)
print(landline ?? "no tengo telefono") // revisa si tiene el

//var strlandline = landline != nil? landline! : "no tengo telefono"
//print(strlandline)

if let landline2 = landline {
    print(landline2)
}

guard let landline2 = landline else {
    fatalError("oops")
}
print(landline2)
//: [Next](@next)
