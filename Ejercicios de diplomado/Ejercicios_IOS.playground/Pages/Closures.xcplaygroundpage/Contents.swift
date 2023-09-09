//: [Previous](@previous)

import Foundation

// closures, bloque de codigo que nos permite definir funciones, las funciones es un tipo de closure

//

let volunteersCounts = [1,2,3,4,5,6,7,8,6,6]

func isAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}
let volunteerSorted = volunteersCounts.sorted(by: isAscending)
print(volunteerSorted)

// hacer lo mismo sin declarar ascending
let volunteerSorted2 = volunteersCounts.sorted(by: {(i: Int, j: Int) -> Bool in i < j})
print(volunteerSorted2)

// hacer  lo mimso, pero más simplificado, porque ya sabe que son int
let volunteerSorted3 = volunteersCounts.sorted(by: {i, j in i < j})
print(volunteerSorted3)

// hacer  lo mimso, pero más simplificado, porque ya sabe que son int, $0 position del primer parametro y $1 position de segundo parametro
let volunteerSorted4 = volunteersCounts.sorted(by: {$0 < $1})
print(volunteerSorted4)

let volunteerSorted5 = volunteersCounts.sorted {$0 < $1} // traning closures
print(volunteerSorted5)

// multiples closures

func doAwsomeWork(on input: String,
                  using transformer: () -> Void,
                  then completion: () -> Void){
    
}

// por defecto nos deja llamar asi
doAwsomeWork(on: "Dipolomado") {
    // here goes the transformer
} then: {
    // here goes the completion
}

// asi lo podemos hacer
doAwsomeWork(on: "Diplomado", using: {}, then: {})

func format(numbers: [Double],
            using formatter: (Double) -> String = {"\($0)"}) -> [String]{ // si no dice el closure, por defecto hace {"\($0)"}
    var result = [String]()
    
    for number in numbers {
        let transformedNumber = formatter(number)
        result.append(transformedNumber)
    }
    
    return result
    
}

let volunteerAverages = [10.6, 12.1, 11.6, 14.1]

func rounder(_ number: Double) -> String{
    let roundedNumber: Int = Int(number) // cuando hacemos el cast, hace el redoneo automaticamente
    return "\(roundedNumber)"
    
}

let formateerAverageVolunteers = format(numbers: volunteerAverages, using: rounder)
print(formateerAverageVolunteers)

print(format(numbers: volunteerAverages))

// map
// filter
// reduce

// map
let roundedVolunteers = volunteerAverages.map{
    number in
    return Int(number)
}
print(roundedVolunteers)

// filter
let passingVolunteers = roundedVolunteers.filter {
    number in
    return number >= 12
}
print(passingVolunteers)

//reduce, regresa un unico valor, valor iniciar con la que va empezar y una varia con la que guarda los resultados parciales

let totolVolunteers = passingVolunteers.reduce(0) {
    partialResult, number in
    return partialResult + number
}
print(totolVolunteers)





//: [Next](@next)
