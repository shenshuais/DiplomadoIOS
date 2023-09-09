//: [Previous](@previous)

import Foundation
// nos permite encapsurar bloques de codigo

let data = [
    ["Eva","30","6"],
    ["Saleh","40","18"],
    ["Amit","50","20"]
]


func printTable(_ dataSource: TabularDataSource){ // TabularDataSource & CustomStringConvertible
    var headerRow = "|"
    var columnWidth = [Int]()
    
    for index in 0..<dataSource.numberOfColumns {
        let label = dataSource.label(forColumn: index)
        let columnHeader = "\(label) |"
        headerRow += columnHeader
        columnWidth.append(label.count)
    }
    
    
    
    print(headerRow)
    
    for index in 0..<dataSource.numberOfRows {
        // start output string
        var output = "|"
        for column in 0..<dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: index, column: column)
            let paddingNeeded = columnWidth[column] - item.count
            let padding = repeatElement(" ", count:paddingNeeded).joined(separator: "")
            output += "\(padding)\(item) |"
        }
        
        print(output)
    }
}




// example protocol

protocol TabularDataSource  { // TabularDataSource: CustomStringConvertible // herencia de protocolos
    var numberOfRows: Int { get } // get para que se pueda leer y set para cambiar
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible{
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person){
        people.append(person)
    }
    
    var numberOfRows: Int{people.count}
    
    var numberOfColumns: Int {3}
    
    var description: String {
        return "Department: \(name)"
    }
    
    func label(forColumn column: Int) -> String {
        let columnHeader: String
        switch column {
        case 0:
            columnHeader = "Employee name"
        case 1:
            columnHeader = "Age"
        case 2:
            columnHeader = "Years of experience"
        default:
            fatalError("Invalid column header index!")
        }
        return columnHeader
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        
        switch column{
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column for person!")
        }
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Eva", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Seleh", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Amit", age: 50, yearsOfExperience: 20))

printTable(department)
print(department)
// CustomStringConvertible: Como imprir en consola

//let operationsDataSource: TabularDataSource = Department(name: "Other")
//
//// casting
//
//let engineeringDataSource = department as TabularDataSource
//
//let testPerson = Person(name: "Shuai", age: 50, yearsOfExperience: 50)
//testPerson is TabularDataSource
//department is TabularDataSource



// Ejmplo de protolo 2

protocol Student {
    var accountNumber: Int { get }
    var name: String { get }
}

struct EngineeringStudent: Student {
    let hasCalculator: Bool
    var accountNumber: Int
    var name: String
}

let engineeringStudent = EngineeringStudent(hasCalculator: true, accountNumber: 313133131, name: "Shuai")

func printstudentInformation(_ student: Student){
    print("\(student.name): \(student.accountNumber)")
    
    if let engineeringStudent = student as?  EngineeringStudent{
        print(engineeringStudent.hasCalculator)
    }
}

//: [Next](@next)
printstudentInformation(engineeringStudent)
