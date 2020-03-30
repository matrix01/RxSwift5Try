import UIKit

/*
 Test 1
 Iterating dictionaries
 */

let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25],
]

var largest = 0
for (kind, numbers) in interestingNumbers {
    print("Checking: \(kind)")
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print("Largest number: \(largest)")


/*
Test 2
return multiple values
*/

func calculateStatistis(scores: [Int]) -> (min: Int, max: Int, sum:Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else if (score < min) {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let stats = calculateStatistis(scores: [5,3,100,3,9])
print("Sum: \(stats.sum), Max: \(stats.max) Min: \(stats.min)")


/*
Test 3
No argument label ("_" for no argument label and use string (ex: "on" day) to show custom argument label)
*/

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}

print(greet("Milan", on: "Friday"))


/*
Test 4
Nested functions
*/

func calculate() -> Int {
    var y = 10
    func add(){
        y += 5
        let x = 10
        func addMore(){
            y += x
        }
        addMore()
    }
    add()
    return y
}
print("Calculated value: \(calculate())")

/*
Test 5
Returning function from function
*/

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number:Int) -> Int {
        return number + 1
    }
    return addOne
}

var incrementer = makeIncrementer()
print("Increment 7 to: \(incrementer(7))")

/*
Test 5
Using function as argument
*/

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number:Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 11, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

/*
Test 6
Block/Closurees
*/

numbers.map({ (number:Int) -> Int in
    let result = 3 * number
    return result
})


/*
Test 7
Block/Closurees: return 0 for odd numbers
*/

numbers.map({ (number:Int) -> Int in
    if number % 2 != 0 {
        return number * 3
    }
    return number * 2
})
print(numbers)

/*
Test 7
Block/Closurees: one line closure when known type
*/

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
print(numbers)

/*
Test 8
Class in Swift
*/

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDesc = shape.simpleDescription()
print(shapeDesc)

/*
Test 8
Class in Swift with initializer
*/

class namedShape {
    var numberOfSides:Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    deinit {
        name = ""
    }
}

class Square: namedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


class EquilateralTriangle: namedShape {
    var sideLength: Double = 0.0
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            test.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size:Double, name:String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}


/*
Test 9
Enum and structures
*/
