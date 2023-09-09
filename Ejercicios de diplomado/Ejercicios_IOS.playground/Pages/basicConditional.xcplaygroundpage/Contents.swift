import UIKit

var greeting = "Hello, playground"

print(greeting)


//conditional if

// ==
let animal = "dog"
if animal == "dog" {
    print("It's a dog!")
} else {
    print("It isn't a dog")
}

// !=
if animal != "dog" {
    print("It isn't a dog")
} else {
    print("It's a dog!")
}

// !
if !(animal == "dog") {
    print("It isn't a dog")
} else {
    print("It's a dog!")
}

// >= <=
if animal.count < 4 {
    print("The word has less than 4 caraters")
} else {
    print("The word has more than 4 caraters")
}

// Multiple conditions || &&
if animal == "dog" || animal == "cat"   {
    print("It's an animal")
} else {
    print("It's not an animal")
}

if animal == "dog" && animal.count == 3   {
    print("It's an dog")
} else {
    print("It's not an dog")
}

// if else if else

if animal == "dog"    {
    print("It's an dog")
} else if animal == "cat"{
    print("It's an cat")
} else {
    print("Neither cat nor dog")
}

// IOS if
if #available(iOS 16.6, *){
    print(true)
}

if #unavailable(iOS 15.0){
    print(true)
}

// ternary operator
var number = 2
number == 2 ? print("It's a 2") : print("not a 2")
var value = number == 3 ? number : 4


// ejercise

var weather = "lluvia"
var time = 12
        
var light = 7...18
var dark = Array(0...6) + Array(19...23)
               

weather == "lluvia" ? print("🌧️") : print ("🌨️")

// derecha contiene option ñ
if light ~= time {
    print("Usar bloqueador")
} else {
    print("No necesitas bloqueador")
}


