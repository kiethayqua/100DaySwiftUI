import Cocoa

// Điểm chung của class với struct
// 1. create and name
// 2. add properties, methods, including property observers and access control
// 3. create custom intitalizers


// Class khác Struct ở 5 điểm
// 1. Có thể tạo 1 class dựa trên 1 class khác, lấy tất cả thuộc tính và phương thức của nó. Có thể ghi đè method
// 2. Bởi vì ý đầu tiên nên class không tự generate khởi tạo cho class. Điều này có nghĩa là cần viết hàm khởi taọ init hoặc gán default value cho tất cả thuộc tính
// 3. Khi copy thuộc tính của 1 class, cả 2 copies chia sẻ data giống nhau - nếu thay đổi 1 copy, cái còn lại cũng thay đổi theo
// 4. Khi copy cuối cùng của 1 class instance bị destroyed, Swift có thể chạy tuỳ ý 1 hàm đặc biệt gọi là deinitializer
// 5. Thậm chí nếu 1 class là constant, vẫn có thể thay đổi thuộc tính của nó miễn nó là variable

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
var newGame = Game()
newGame.score += 10

// class inheritance
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSumary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSumary() {
        print("I'm a developer who will sometimes work \(hours) a day")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let kiet = Developer(hours: 8)
let cuong = Manager(hours: 10)
kiet.work()
cuong.work()
kiet.printSumary()
cuong.printSumary()

// dùng final để mark 1 class không support inheritance


// nếu class con có thuộc tính
// dùng super để lấy thuộc tính của class cha
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// copy class instance
// sẽ copy reference
// khi user2 thay đổi => user1 thay đổi do đang trỏ cùng ref
// khác với struct, struct là nguyên thuỷ
class User {
    var username = "Anonymous"
    
    // tạo 1 function safely copy
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}
var user1 = User()
var user2 = user1
user2.username = "Kiet Dev"
print(user1.username)
print(user2.username)

var user3 = User()
var user4 = user3.copy()
user4.username = "Test"
print(user3.username)
print(user4.username)

// Tạo deinitializer cho class
class TestUser {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [TestUser]()

for i in 1...3 {
    let user = TestUser(id: i)
    print("User  \(user.id): I am in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")


// class không cần dùng mutating keyword để thay đổi data thuộc tính từ func


// Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

// But there’s more:

// 1. The Animal class should have a legs integer property that tracks how many legs the animal has.
// 2. The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
// 3. The Cat class should have a matching speak() method, again with each subclass printing something different.
// 4. The Cat class should have an isTame Boolean property, provided using an initializer.

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Gau...Gau...Gau")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Hahahaa")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Hihihi")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meo...Meo")
    }
}

class Persian: Cat {
    override func speak() {
        print("MEOMEOMEO")
    }
}

class Lion: Cat {
    override func speak() {
        print("GRUUU")
    }
}




