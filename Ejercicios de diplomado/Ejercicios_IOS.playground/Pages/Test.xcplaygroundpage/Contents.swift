//: [Previous](@previous)
// Principios
// First: Fast, Isolated, Repeatable, Validating, Exhuast.

import XCTest

class myTest: XCTestCase{
    
    func getFullName(_ nameTupla: (String, String?, String, String?)) -> String {
        
        var result: String = nameTupla.0
        
        let second = nameTupla.1
        result += second != nil ? " \(second!)" : "" // asegurar que no es pacio 
        
        result += " \(nameTupla.2)"
        
        let fourth = nameTupla.3
        result += fourth != nil ? " \(fourth!)" : ""
        
        return result
    }
    
    // no parametros, no returns siempre empieza con test_
    func test_GetFullName(){
        // given
        let firstPerson: (String, String?, String, String?) = (first: "Shuai", second: "Shuai", firstLastName: "Shen", secondLastName: "Shen")
        let secondPerson: (String, String?, String, String?) = (first: "Shuai", second: nil, firstLastName: "Shen", secondLastName: nil)
        
        // when
        let firstFullName = getFullName(firstPerson)
        let secondFullName = getFullName(secondPerson)
        
        // then
        XCTAssertEqual(firstFullName, "Shuai Shuai Shen Shen")
        XCTAssertEqual(secondFullName, "Shuai Shen")
    }
}

myTest.defaultTestSuite.run()
//: [Next](@next)
