//: [Previous](@previous)

import Foundation

let someArray: Array<Int> = [Int]()

// stack
//lasi in - first out
// push and pop

//struct Stack<Element> {
//    var items = [Element]()
//
//    mutating func push(_ newItem: Element){
//        items.append(newItem)
//    }
//
//    mutating func pop() -> Element?{
//        guard !items.isEmpty else {return nil}
//        return items.removeLast()
//    }
//}

//var intStack: Stack<Int> = Stack()
//var doubleStack: Stack<Double> = Stack()
//intStack.push(1)
//intStack.push(2)
//
//print(intStack.pop())
//print(intStack.pop())
//print(intStack.pop())

// map
//func myMap<T, U>(_ items: [T], _ transfromer: (T) -> (U)) -> [U]{
//    var result = [U]()
//    for item in items {
//        let transformedItem = transfromer(item)
//        result.append(transformedItem)
//    }
//    return result
//}

//let myStrings = ["one", "two", "three"]
//let stringLengths = myMap(myStrings) { $0.count}
//print(stringLengths)

// mapping a stack

//struct Stack<Element> {
//    var items = [Element]()
//
//    mutating func push(_ newItem: Element){
//        items.append(newItem)
//    }
//
//    mutating func pop() -> Element?{
//        guard !items.isEmpty else {return nil}
//        return items.removeLast()
//    }
//
//    func myMap<U>(_ transfromer: (Element) -> (U)) -> Stack<U>{
//        var result = [U]()
//        for item in items {
//            let transformedItem = transfromer(item)
//            result.append(transformedItem)
//        }
//        return Stack<U>(items: result)
//    }
//}
//
//var intStack = Stack<Int>()
//intStack.push(1)
//intStack.push(2)
//
//var dobledStack = intStack.myMap { $0 * 2}
//print(dobledStack)

// asegurar que T sea un elementos que cumple con el protocolo Equitable
func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool{
    return first == second
}

print(checkIfEqual("Shuai", "Shuai"))

func checkIFExpresionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool{
    return first.description == second.description
}

print(checkIFExpresionsMatch(Float(1.0), Double(1.0)))


// protocolo con un tipo de datos generico
//protocol IteratorProtocol{
//    associatedtype Element
//    mutating func next() -> Element?
//}

// protocol sequence
//protocol Sequence{
//    associatedtype Iterator: IteratorProtocol
//    associatedtype Element where Element == Iterator.Element
//
//    func makeIterator() -> Iterator
//}

struct Stack<Element>: Sequence {
    typealias Iterator = StackIterator
    typealias Element = StackIterator<Element>.Element
    var items = [Element]()

    mutating func push(_ newItem: Element){
        items.append(newItem)
    }

    mutating func pop() -> Element?{
        guard !items.isEmpty else {return nil}
        return items.removeLast()
    }
    
    func makeIterator() -> StackIterator<Element>{
        return StackIterator(stack: self)
    }
    
    mutating func pushAll<S: Sequence>(_ sequence: S) where S.Element == Element{
        for item in sequence{
            self.push(item)
        }
    }
}

struct StackIterator<T>: IteratorProtocol {
    typealias Element = T
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

for value in myStack {
    print("for in loop: get \(value)")
}

var myStackIterator = StackIterator(stack: myStack)
while let value = myStackIterator.next(){
    print(value)
}




//// protocol sequence
//protocol Sequence{
//    associatedtype Iterator: IteratorProtocol
//    associatedtype Element where Element == Iterator.Element
//
//    func makeIterator() -> Iterator
//}

//: [Next](@next)
