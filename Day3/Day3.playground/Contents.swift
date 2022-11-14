import Cocoa

// Array

// declare
var students = ["Kiet", "Hung"]
var scores = [9.5, 10.0, 8.3]

// get value
print(students[0])
print(scores[1])

// add new value
students.append("Phat")
scores.append(7.5)

// error: cannot '+' String and number
//let notAllowed = students[0] + scores[0]
let allowed = "\(students[0]) with \(scores[0])"
print(allowed)

// create empty array
var books = Array<String>()
books.append("Mat biec")
books.append("Ngoi khoc tren cay")
print(books[1])

// other way
var singers = [String]()
singers.append("Trinh Dinh Quang")
singers.append("Ho Quang Hieu")
print(singers[1])

// length of array
let totalStudents = students.count
print(totalStudents)

// remove specific index
scores.remove(at: 1)
print(scores)

// remove all
scores.removeAll()
print(scores)

// check an array contains a particular item
print(singers.contains("Trinh Dinh Quang"))

// sort array
print(students.sorted())
let nums = [9, 8, 1, 10, 12]
print(nums.sorted())

// revert array
let sortedStudents = students.sorted()
let reversedSortedStudents = sortedStudents.reversed()
print(reversedSortedStudents)

// -----------------------------------------------

// Dictionary

// declare
let employee = [
    "name": "Nguyen Phuc Kiet",
    "age": "23",
    "job": "Developer"
]

// get value
// Throws up warnings
// print => Optional("Nguyen Phuc Kiet")
// because if in dictionaity not contains key => the value return nil => not crash
print(employee["name"])

// default value
// no warning and return value not contains Optional
print(employee["name", default: "Kiet Nguyen"])

// other way
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Kiet Nguyen"] = 70

// overide key
var info = [String: String]()
info["name"] = "Nguyen Phuc Kiet"
info["age"] = "20"
info["job"] = "Developer"
info["age"] = "23"
print(info["age", default: "20"])

// -----------------------------------------------

// Set

// set not contains duplicate value
// declare
var people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people)

// adđ new value
// khi them moi, set khong them theo thu tu
people.insert("Nguyen Phuc Kiet")
print(people.contains("Nguyen Phuc Kiet"))

// -----------------------------------------------

// Enum

// declare
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

var day = Weekday.monday
day = Weekday.friday
day = Weekday.sunday
print(day == .sunday)
