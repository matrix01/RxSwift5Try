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

