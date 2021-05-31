import UIKit

//1
let a: Double = 5
let b: Double = 10
var average = (a + b) / 2
//

//2
var name = (firstName:"Steve",lastName:"Jobs")
print("Full name: \(name.firstName) \(name.lastName)")
//

//3
var first: Float?
var second: Float? = 5

func printer(float: Float?) {
    guard let float = float else { print("Variable can't be unwrapped")
        return }
    print(float)
}

printer(float: first)
printer(float: second)
//

//4
func numbers(_ n: Int) {
    var a = 1
    var b = 0
    (0...n).forEach { _ in
        print(b)
        (a,b) = (a + b, a)
    }
}

//numbers(7)
//

//5

func sorted(arr: inout [Int]) {
    var index = arr.count
    (1..<arr.count).forEach { i in
        index -= 1
        for i in 1...index {
            let previous = arr.index(before: i)
            arr[i] < arr[previous] ? arr.swapAt(previous, i) : nil
        }
    }
    print(arr)
}
var array = [3,5,4,1,2,7]
sorted(arr: &array)
//

//6

var string = "storm67"
func new(str: String) -> String {
    var test = str
    var another = ""
    str.forEach {
        if $0.isNumber {
            another.append($0)
            guard let index = str.firstIndex(where: { $0.isNumber }) else { return }
            test.remove(at: index)
        }
    }
    guard var number = Int(another) else { return ""}
    number += 1
    test.append(String(number))
    return test
}

new(str: string)
///

//BLOCK 3
//1
var myClosure = {
    print("I love swift")
}

func repeatTask (times: Int, task: () -> Void) {
    for _ in 0...times {
        myClosure()
    }
}

repeatTask(times: 10, task: myClosure)
//

//2
enum Directions {
    case up
    case down
    case left
    case right
}

var locations = (0,0)
var encounter: [Directions] = [.up, .up, .left, .down, .left, .down, .down, .right, .right, .down, .right]

func directionChanger(direction: Directions) {
    switch direction {
    case .up: locations.0 += 1
    case .down: locations.0 -= 1
    case .left: locations.1 -= 1
    case .right: locations.1 += 1
    }
}

encounter.forEach {
    directionChanger(direction: $0)
}
print(locations)
//

//3

class Rectangle {
    var length: Int
    var width: Int
    
    init(length: Int,width: Int) {
        self.length = length
        self.width = width
    }
    
    func perimeter() -> Int {
        2 * (length + width)
    }
    
}

let rectangle = Rectangle(length: 50, width: 50)
rectangle.perimeter()

extension Rectangle {
    var square: Int {
        length * width
    }
}

print(rectangle.square)
//
