//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


// extensions
extension Double {
    var squared: Double {
        return self * self
    }
}

let sidelenght: Double = 12.5
let area = sidelenght.squared

struct Car {
    let maker: String
    let model: String
    let year: Int
    
    var fuelLevel: Double {
        willSet{
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must between 0 and 1")
        }
    }
}

// comform protocol
extension Car: CustomStringConvertible {
    var description: String {
        "\(maker) - \(model)"
    }
}

// Initializars
extension Car {
    init(maker: String, model: String) {
        self.init(maker: maker, model: model, year: 2023, fuelLevel: 1.0)
    }
}

// nasted type

extension Car {
    enum Era {
        case vintage, classic, modern
    }
    
    var era: Era {
        switch year {
        case ...1990:
            return .vintage
        case 1991...2000:
            return .classic
        case 2001...:
            return .modern
        default:
            return .modern
        }
    }
}

// add method
extension Car{
    mutating func fillFuel(){
        fuelLevel = 1.0
    }
}


var firstCar = Car(maker: "Honda", model: "Civic", year: 2020, fuelLevel: 0.5)
var secondCar = Car(maker: "Lambo", model: "Huracan")
print(firstCar)
print(firstCar.era)
print(firstCar.fuelLevel)
firstCar.fillFuel()
print(firstCar.fuelLevel)
print(secondCar)
print(secondCar.era)


//: [Next](@next)
