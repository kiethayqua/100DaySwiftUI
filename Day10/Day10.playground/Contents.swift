import Cocoa

// Khai báo 1 struct
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) \(year) by \(artist)")
    }
}

// Tạo instance
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()


// khi muốn thuộc tính có thể thay đổi giá trị
// dùng 'mutating' keyword
struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// cú pháp tạo instance là cú pháp đặc biệt
// Swift âm thầm tạo 1 function đặc biệt bên trong struct gọi là init()
var archer1 = Employee.init(name: "Sterling Archer", vacationRemaining: 15)

// giá trị mặc định
struct Todo {
    let title: String
    var status: Bool = false
    
    mutating func onDone() {
        status = true
    }
}

var todo1 = Todo(title: "Coding");
print(todo1.status);
var todo2 = Todo(title: "Eating", status: true)
print(todo2.status)


// Swift có 2 kiểu thuộc tính là stored property và computed property
// - stored property là thuộc tính tạo bởi let or var
// - computed property là là trộn cả 2 (stored property và function)
// computed property được access như stored property nhưng làm việc như function
struct EmployeeEnhance {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        // Swift tự cung cấp newValue
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}
var kiet = EmployeeEnhance(name: "Nguyen Phuc Kiet")
kiet.vacationTaken += 5
print(kiet.vacationRemaining)
kiet.vacationTaken += 3
print(kiet.vacationRemaining)
kiet.vacationRemaining = 10
print(kiet.vacationTaken)
print(kiet.vacationAllocated)


// Property observer
// gồm có didSet run khi property đã thay đổi và willSet run trước khi property thay đổi
struct Game {
    var score = 0
}

var game = Game()

// Mỗi khi score change ta phải in ra giá trị mới
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1
print("Score is now \(game.score)")

// thêm property observer giải quyết vấn đề này
struct GameEnhance {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var gameEnhance = GameEnhance()
gameEnhance.score += 10

struct App {
    var contacts = [String]() {
        // Swift tự cung cấp 'newValue'
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        // Swift tự cung cấp 'oldValue'
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Kiet Nguyen")
app.contacts.append("Hung Dao")

// custom hàm khởi tạo init
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 0...9)
    }
}

let player = Player(name: "Kiet Nguyen")
print(player.number)
