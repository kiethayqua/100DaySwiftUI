import Cocoa

// Two ways of storing data:

// 1. Using var to store variables
var myAge = 20
myAge = 21
myAge = 22

// 2. Uing let to store constants
let myName = "Nguyen Phuc Kiet"

// ----------------------------------------------------

// Creating strings
let mySchool = "PTIT"

// Other double quotes inside the strings
let myQuote = "I love \"Forever and one\" song"

// Multiple lines
let lyric = """
    What can I do?
    Will I be getting through?
    Now that I must try
    To leave it all behind...
"""

// Read length of string
let myNameLength = myName.count
print(myNameLength)

// uppercase string
let myNameUppercase = myName.uppercased()
print(myNameUppercase)

// hasPrefix
let greeting = "Hello, My name is Kiet"
let isHello = greeting.hasPrefix("Hello")

// hasSuffix
let myFile = "DiscoverySearch.js"
let isJSFile = myFile.hasSuffix(".js")

// ----------------------------------------------------

// Creating Int
let score = 10
let reallyBig = 10_000_000_000
let number = 120
print(number.isMultiple(of: 3))

// ----------------------------------------------------

// Creating Double
let myScore = 9.5

// Try:
let a = 5
let b = 2.5
//print(a + b) -> error cause Swift is Type Safety, cannot '+' when a is Int and b is Double
print(Double(a) + b)
print(a  + Int(b))

