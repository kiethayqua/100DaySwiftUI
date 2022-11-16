import Cocoa

// protocol
protocol Vehicle {
    var name: String {get}
    var currentPassengers: Int {get set}
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
let bike = Bicycle()
commute(distance: 50, using: bike)
commute(distance: 100, using: car)
getTravelEstimates(using: [car, bike], distance: 100)


// opaque return types (quan trọng)
// chưa hiểu
// đại khái là che dấu kiểu dữ liệu trả về
// kiểu trả về có thể là protocol
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...9)
}
print(getRandomNumber() == getRandomNumber())


// Extension
// ví dụ String có 1 method là trimmingCharacters
extension String {
    // khi return về giá trị mới dùng -ed
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // khi modified thì không có -ed
    mutating func trim() {
        self = self.trimmed()
    }
    
    // giống như sort và sorted
}

var quote = "  The truth is rarely pure and never simple  "
quote.trim();
print(quote)


// protocol extension
protocol Person {
    var name: String {get}
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let kietNguyen = Employee(name: "Kiet Nguyen")
kietNguyen.sayHello()

// Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

// 1. A property storing how many rooms it has.
// 2. A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
// 3. A property storing the name of the estate agent responsible for selling the building.
// 4. A method for printing the sales summary of the building, describing what it is along with its other properties.

protocol Building {
    var rooms: Int {get set}
    var costs: Int {get set}
    var name: String {get}
    func summary()
}

extension Building {
    func summary() {
        print("The \(name) has \(rooms) with $\(costs)")
    }
}

struct House: Building {
    let name: String
    var rooms: Int
    var costs: Int
}

struct Office: Building {
    let name: String
    var rooms: Int
    var costs: Int
}

let whiteHouse = House(name: "White House", rooms: 200, costs: 1_000_000)
let shoppeeOffice = Office(name: "Shoppee Office", rooms: 10, costs: 500_000)
whiteHouse.summary()
shoppeeOffice.summary()
