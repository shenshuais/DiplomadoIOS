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

//CaseIterable

enum youPet: String, CaseIterable {
    case dog = "🐶"
    case cat = "🐱"
}

let allCases = youPet.allCases
for pet in allCases{
    print(pet.rawValue)
}


enum contactMehod {
    case email(String)
    case phone(Int)
    case mail(streeName: String, zipCode: String, streetNumber: Int)
    
}

var myProferrendContactMethod = contactMehod.email("myemail@email.com")

switch myProferrendContactMethod {
    case .email(let strEmail): print(strEmail)
    case .phone(let num): print(num)
    case .mail(streeName: let name, zipCode: let zc, streetNumber: let sn): print("Address \(name) \(zc) \(sn)")
    
}

// recursividad (6+(4*(8-1))/2)

enum ArithmeticExpression {
    case number(Double)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    indirect case subtraction(ArithmeticExpression, ArithmeticExpression)
    indirect case division(ArithmeticExpression, ArithmeticExpression)
}

let eight = ArithmeticExpression.number(8)
let one = ArithmeticExpression.number(1)
let minus = ArithmeticExpression.subtraction(eight, one)
let product = ArithmeticExpression.multiplication(minus, ArithmeticExpression.number(4))
let divide = ArithmeticExpression.division(product, ArithmeticExpression.number(2))
let add = ArithmeticExpression.addition(ArithmeticExpression.number(6), divide)


func evaluate(expression: ArithmeticExpression) -> Double {
    switch expression {
        case .number(let number): return number
        case .addition(let leftExp, let rightExp): return evaluate(expression: leftExp) + evaluate(expression: rightExp)
        case .multiplication(let leftExp, let rightExp): return evaluate(expression: leftExp) * evaluate(expression: rightExp)
        case .subtraction(let leftExp, let rightExp): return evaluate(expression: leftExp) - evaluate(expression: rightExp)
        case .division(let leftExp, let rightExp): return evaluate(expression: leftExp) / evaluate(expression: rightExp)
    }
}

evaluate(expression: add)

// estructura and classed

class Car {
    var wheels: Int
    var color: String
    
    init(wheels: Int, color: String){
        self.wheels = wheels
        self.color = color
    }
}

let myCar = Car(wheels: 4, color: "Black")
myCar.color = "Blue"
// apesa de que myCar es un constante, podemos cambiar sus valores por se una clase, esto no se puede hacer con una estructura, esto pasa
// por que la clase usa apuntadores que apunta a la direccion de la memoria, entonces no estamos cambiando la direccion de memoria sino
// el valor que esta ahi

let copyOfMyCar = myCar
// si cambio la de copia también va cambiar el color de myCar, porque es un referencia
copyOfMyCar.color = "Red"
print(myCar.color)
print(copyOfMyCar.color)


struct Dog {
    var name: String
    var isAdopted: Bool
}

var dante = Dog(name: "Dante", isAdopted: true)
var copyOfDante = dante

copyOfDante.isAdopted = false
dante.isAdopted = true

print(copyOfDante.isAdopted)
print(dante.isAdopted)

// las clases puede heredar, pero las estructuras no puede heredar

class Vehicle {
    var wheels: Int?
    
    init(wheels: Int){
        self.wheels = wheels
    }
}

// herencia, scooter hereda de vehicle
//class Scooter: Vehicle {
//    var color: String
//    // inicializador custumed and designated
//    init(color: String = "azul"){
//        self.color = color
//
//    }
//}
//
//let myVehicle = Scooter()


// propiedades computadas
enum Pet2: String {
    case dog = "🐶"
    case cat = "🐱"
    case mouse = "🐭"
    
    var type: String {
        switch self{
        case .dog, .cat: return "mamifero"
        case .mouse: return "small_mamifero"
            
        }
    }
}

let myPet2 = Pet2.dog.type

// observadores de propiedades
struct Dog2 {
    var color: String
    var isAdopted: Bool = true
    
    var name: String{
        willSet(newName){
            print("My new name is \(newName)")
        }
        didSet{
            print("My old name was \(oldValue)") // por defecto se llama oldValue
        }
    }
    
    // propiedades estadaticos
    static let amountOfPaws = 4
    var paws: Int = 4
    var specialNeeds: Bool {
        paws != Dog2.amountOfPaws // or Self.amountOfPaws, Self grande se refiere a la estructura
    }
    
    func getID() -> String {
        return name + "\n" + color + "paws \(paws)"
    }
    
    // funcion para cambiar una propiedad
    mutating func changeName(newName: String){
        name = newName
    }
    
    static func describeADog() -> String {
        "Dogs are really cute animals!"
    }
    
    init(name: String, isAdopted: Bool, color: String){
        self.name = name // self se refiere a la instancia
        self.isAdopted = isAdopted
        self.color = color
    }
    
    init(adopted name: String, color: String){
        self.name = name // self se refiere a la instancia
        self.isAdopted = true
        self.color = color
    }
    
    init(bought name: String, color: String){ // combinaciones de inits
        self.init(name: name, isAdopted: false, color: color)
    }
    
    init(){
        self.init(adopted: "Milaneso", color: "Brown")
    }
    
    
}

var myDog2 = Dog2(name: "Dante", isAdopted: true, color: "Brown") // inicializador 1
var myDog3 = Dog2(adopted:"Dante", color: "Brown") // inicializador 2
var streetDog = Dog2()
myDog2.name = "Milaneso"
print(Dog2.amountOfPaws)
myDog2.paws = 3
myDog2.specialNeeds
myDog2.getID()
myDog2.changeName(newName: "Pato")
Dog2.describeADog()

// Enumelador

enum Pet3: String {
    case dog = "🐶"
    case cat = "🐱"
    
    init?(name: String) {
        switch name {
        case "dog" : self.init(rawValue: "🐶")
        case "cat" : self.init(rawValue: "🐱")
        default: return nil
        }
    }
}

let myPet3 = Pet3(name: "dog")

// class

class Vehicle2 {
    var brand: String
    let model: String
    var owner: String?
    let serialNumber: String
    var wheels: Int?
    // inicializador designado
    init( brand: String, model: String, serialNumber: String){
        self.brand = brand
        self.model = model
        self.serialNumber = serialNumber
    }
    
    // variables computadas solo de es tipo get
    var type: String{ // ?? si wheels es nil toma 0 sino toma el valor de wheels
        return (wheels ?? 0) > 0 ? "land":"other"
    }
    
    var registration: (name: String, serialNumber: String, type: String)? {
        get { // este valor no es fijo
            if let owner = owner{
                return (owner, serialNumber, type)
            }
            return nil
        }
        set(newRegistration){
            if let newRegistration = newRegistration{
                owner = newRegistration.name
            }
        }
    }
    
    
    var isMoving: Bool = false // private var isMoving: Bool = false, la variable solo puede ser mmodificada por move y stop
    // funciones de instancia
    func move(){
        isMoving = true
    }
    func stop(){
        isMoving = false
    }
    
    // funcion del tipo, metodo de clase
    static func describe(){
        print("a vehicle")
    }
    
    func makeNoise() -> String {
        "Noise"
    }
    
}

var Car2 = Vehicle2.init(brand: "VW", model: "Bora", serialNumber: "123123")
var CaR3 = Vehicle2(brand: "Seat", model: "Ibiza", serialNumber: "321321")

Car2.registration = (name: "Shuai", serialNumber: "123123213", type: "other")
Car2.move()
Car2.isMoving
Car2.stop()
Car2.isMoving

class Cars: Vehicle2{
    // modificar valores conputados y funciones
    override var type: String {
        return "Car"
    }
    
    var isElectric: Bool
    
    init(electric: Bool, brand: String, model: String, serialNumber: String){
        self.isElectric = electric // primer actual
        super.init(brand: brand, model: model, serialNumber: serialNumber) // luego la super
    }
    
    override func makeNoise() -> String {
        "BRRRRRRM"
    }
    
    override init(brand: String, model: String, serialNumber: String) {
        isElectric = brand == "Toyota"
        super.init(brand: brand, model: model, serialNumber: serialNumber)
    }
    
    convenience init(suzukiModel model: String, serialNumber: String, isElectric: Bool, boughtBy name: String){
        self.init(electric: isElectric, brand: "suzuki", model: model, serialNumber: serialNumber)
        owner = name
    }
    
    override var brand: String{
        willSet(newBrand){
            print("The new brand is \(newBrand)")
        }
        didSet{
            print("The old brand  was \(oldValue)") // por defecto se llama oldValue
        }
    }
    
    
}

let Car4 = Cars(electric: true, brand: "Toyota", model: "some", serialNumber: "1232132")
Car4.isElectric
Car4.makeNoise()
Car4.brand = "VW"






