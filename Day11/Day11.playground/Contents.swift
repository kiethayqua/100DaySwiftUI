import Cocoa

// Access control
struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var bidv = BankAccount()
bidv.deposit(amount: 1_000_000)

// Swift cung cấp vài lựa chọn
// - private -> gọi ngoài struct không được
// - fileprivate -> gọi ngoài file không được
// - public -> gọi ở đâu cũng được
// - private(set) -> đọc thuộc tính ở bất kì đâu, nhưng không được set, chỉ method trong struct mới có quyền set
// Note: Nếu dùng private cho nhiều property thì phải custom hàm khởi tạo init (khi gắn private cho thuộc tính funds => không thể tạo instance bằng BankAccount(funds: 1_000_000) vì vậy cần phải custom lại hàm init)



// Static property
struct School {
    static var studentCount = 0
    
    // không cần thêm mutating do static không có instance
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Kiet Nguyen")
print(School.studentCount)

// create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?

struct Car {
    let model: String
    let numOfSeats: Int
    private var currentGear: Int
    
    init(model: String, numOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numOfSeats = numOfSeats
        self.currentGear = currentGear
    }
    
    mutating func controlGear(number: Int) {
        if number < 0 || number > 10 {
            print("Out of range")
        } else {
            currentGear = number
        }
    }
    
    func getCurrentGear() -> Int {
        currentGear
    }
}

var bmw = Car(model: "BMW", numOfSeats: 4, currentGear: 2)
bmw.controlGear(number: 2)
print(bmw.getCurrentGear())





