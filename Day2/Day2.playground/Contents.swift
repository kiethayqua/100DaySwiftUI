import Cocoa

// Declare Boolean
let filename = "kietnguyen.jpg"
print(filename.hasSuffix(".jpg"))

var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)

// -----------------------------------

// two ways to combine strings together

let greeting = "Hello, my name is"
let myName = "Kiet"

// 1. Using  '+'
print(greeting + " " + myName)

// 2. Using string interpolation
print("\(greeting) \(myName)")

// -----------------------------------

// Problem:
// 1. Creates a constant holding any temperature in Celsius.
// 2. Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
// 3. Prints the result for the user, showing both the Celsius and Fahrenheit values.
let cTemp = 100.0
let fTemp = cTemp * 9 / 5 + 32.0
print("\(cTemp)°C = \(fTemp)°F")
