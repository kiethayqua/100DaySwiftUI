import Cocoa

// Create a closure

func greetUser() {
    print("Hi there!")
}
greetUser()
// create a variable to copy greetUser func
var greetCopy = greetUser
// call copy func
greetCopy()

// Nếu muốn bỏ qua việc tạo 1 func và gán trực tiếp vào biến hoặc constant thì
// Đây là closure
let sayHello = {
    print("Hi there!")
}
sayHello()

// Nếu muốn closure có parameter thì
// sau 'in' là body của closure
let sayHi = { (name: String) -> String in
    return "Hi \(name)"
}
sayHi("Kiet")

// ví dụ:
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
// muốn sorted Suzanne lên đầu những ng còn lại thì alphabet
let captainFirstSorted = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})

print(captainFirstSorted)

// shorthand dùng trailing closure
// Swift biết data type của params và return type
// bỏ (by:)
let short = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}
print(short)

// Swift biết số lượng tham số truyền vào
// $0 đại diện tham số đầu, tiếp tục là $1, $2, ...
let shortShort = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}
print(shortShort)

// Nếu chỉ sort theo alphabet
// do chỉ 1 dòng nên hiểu là return $0 < $1
let shortShortShort = team.sorted {$0 < $1}
print(shortShortShort)

// Một số example về closure
// tìm trong team người có tên bắt đầu bằng 'T'
let findT = team.filter {$0.hasPrefix("T")}
print(findT)

// in hoa tên tất cả thành viên trong team
let upperCaseTeamName = team.map {$0.uppercased()}
print(upperCaseTeamName)


// Thực hành:
// cho mảng:
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Your job is to:
// 1. Filter out any numbers that are even
// 2. Sort the array in ascending order
// 3. Map them to strings in the format “7 is a lucky number”
// 4. Print the resulting array, one item per line

let evenNums = luckyNumbers.filter {$0 % 2 == 0}
print(evenNums)

let ascNums = luckyNumbers.sorted {$0 < $1}
print(ascNums)

let oddLuckyNums = luckyNumbers.sorted {$0 < $1}.filter {$0 % 2 != 0}.map {"\($0) is a lucky number"}
print(oddLuckyNums)

for num in oddLuckyNums {
    print(num)
}
