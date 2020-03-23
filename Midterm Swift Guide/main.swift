#!/usr/bin/swift

import Foundation

print("Create an instance of an immutable String, and print it out")
let immutable : String = "can't change me"
print(immutable + "\n\n")


print("Create an instance of a mutable String, and print it out, then prove that it is.")
var mutable : String = "you CAN change me, though"
mutable = "i am changed"
print(mutable + "\n\n")


print("Print out all of the characters in the following String: “abcdefghijklmnopqrstuvwxyz”, one by one, using a for loop.")
let alpha : String = "abcdefghijklmnopqrstuvwxyz"
for index in alpha.indices {
  print("\(alpha[index]) ", terminator: "")
}
print("\n\n")


print("Write out a formula in Swift for printing out the 6th character in the String.\nHint: You will need an Index to do that.\nget the start index;  Get the index offset from the start; access the character, and print it out")
print(alpha[alpha.index(alpha.startIndex, offsetBy: 5)], "\n\n")


print("Write out a formula in Swift (in one line) for finding the length of the String: 'Call me Ishmael.'")
let ish = "call me ishmael."
print(ish.count, "\n\n")


print("Print out the unicode values (base 10) of the above String 'Call me Ishmael.'")
for index in ish.indices {
  print(String(format:"%02d", ish[index].unicodeScalars.first!.value), terminator: " ")
}
print("\n\n"a


print("Print out the unicode values (base 16) of the above String 'Call me Ishmael.'")
for index in ish.indices {
  print(String(format:"\0x%02x", ish[index].unicodeScalars.first!.value), terminator: " ")
}
print("\n\n")


print("Write out the formula for reversing the String 'Call me Ishmael'.")
print(String(ish.reversed()) + "\n\n")


print("Create a String equivalent of the number 2371.")
let n : Int = 2371
let s : String = String(n)
print("\(n) as a String looks like this '\(s)'\n\n")


print("Given that “middle” in Chinese is “zhong1”: unicode 4e2d, and “kingdom” is: “guo2”: 570d, print the Chinese characters for 'China (zhong1 guo2)' in unicode.")
print("\u{4e2d}\u{570d}" + "\n\n")


print("Convert the following String to all uppercase: 'cal state fullerton'.")
print("cal state fullerton".uppercased() + "\n\n")


print("Change all of the vowels (a,e,i,o,u, and y) to be ‘Z’.")
let word = "sUpErcAlifragilisticexpialadotiOUs"
let newword  = word.replacingOccurrences(of: "[aeiouy]", with: "Z", options: [.regularExpression, .caseInsensitive], range: nil)
print("newword is: \(newword)\n\n")


print("Change all instances of 'ss' in the following string to be ‘AMTRAK’: 'Mississippi'.")
print("Mississippi".replacingOccurrences(of: "ss", with: "AMTRAK") + "\n\n")


print("Determine if the following String has the prefix or suffix '__': __add__.")
var sadd = "__add__"
let pre = "__"
let prefix = sadd.hasPrefix(pre)
print("\(sadd) has prefix \(pre) is: \(prefix ? "YES" : "no")" + "\n\n")


print("For the above '__add__' String, strip the '__' to get just: 'add'.")
//print("'\(sadd)' stripped of '__' is: '\((in: "__"))'")
print("dropping the '__' prefix and suffix from \(sadd) gives us: ============> ", terminator: " ")
if (sadd.hasPrefix(pre)) { sadd = String(sadd.dropFirst(pre.count)) }
if (sadd.hasSuffix(pre)) { sadd = String(sadd.dropLast(pre.count)) }
print("'\(sadd)'\n\n")


print("Using a range, print out all of the cubes (x^3) of x from x=1 to 10, inclusive.")
for i in 1 ... 10 { print("\(i * i * i)", terminator:" ") }
print("\n\n")


print("Using a range, print out all of the squares of x from x=[1,10).")
for i in 1 ..< 10 { print("\(i * i)", terminator:" ") }
print("\n\n")


print("Write an instance of a variable of type Int that declares the type and its value.")
var type : Int = 333
print("var type: \(type) declared its type as Int\n\n")


print("Write an Int instance that declares its value but not its type.")
var notype = 22
print("var notype: \(notype) did not declare its type\n\n")


print("Write an instance of an Int more than 10000000 in value that uses underscores.")
var big = 10_000_000
print("var big has size \(big)\n\n")


print("Create a switch statement that handles the following ranges of error codes:\n100 or 101: \"Informational, 1xx\"\n204: \"Successful but no content, 204\"\n300 to 307: \"Redirection: 3xx\"\n400 to 505: \"Server error\"\notherwise: \"Unknown error. Please retry\"")
func handleError(_ code: Int) {
  print("handling error code: \(code)... =========> ", terminator: " ")
  switch(code) {
    case 100,101: print("Informational, 1xx")
    case 204: print("Successful but not content, 204")
    case 300...307: print("Redirection: 3xx")
    case 400...505: print("Server error")
    default: print("Unknown error")
  }
}
print("\n")
handleError(101)
handleError(204)
handleError(303)
handleError(306)
handleError(500)
handleError(600)
print("\n")


print("Create a named tuple: lname, fname, cwid, gpa that describes a student, using a typealias similar to this: typealias point = (x: Double, y: Double).  Then, create a student, and print out the tuple’s elements from the student")
typealias Student = (lname: String, fname: String, cwid: String, gpa: Double)
var agent : Student = (lname: "Smith", fname: "Agent", cwid: "00000", gpa: 9.9)
let agent_id = Mirror(reflecting: agent)
for val in agent_id.children { print("\(val.label!) : \(val.value)", terminator: ",") }
print("\n\n")


print("if you have the following code: let point = (x: 1, y: 4), write a switch that uses cases and where statements to determine if the angle between the point and the positive x axis is acute, right, obtuse, or straight.")
func determine_angle(x: Double, y: Double) {
  let radius = sqrt(x * x + y * y)
  let theta = acos(x / radius)    // acos used because domain is 0 to pi radians

  print("point with value (\(x),\(y)) w/ +x axis...  =====> ", terminator: " ")
  switch (theta) {
  case let val where val == Double.pi:
    print("STRAIGHT angle")
  case let val where val > Double.pi / 2.0:
    print("OBTUSE angle")
  case let val where val == Double.pi / 2.0:
    print("RIGHT angle")
  case let val where val < Double.pi / 2.0:
    print("ACUTE angle")
  default:
    print("none of the above")
  }
}
determine_angle(x: -4.0, y: 0.0)
determine_angle(x: -2.0, y: 4.0)
determine_angle(x: 0.0,  y: 4.0)
determine_angle(x: 4.0,  y: 0.0)
print("\n")


print("Write a Switch statement that prints out 'I will study Swift every day' 25 10 times. Be sure that each statement is numbered, and that the lines are all right-justified.\n1. I will study Swift every day.\n2. I will study Swift every day.\n...")
for _ in 1 ... 10 { print("I will study Swift every day.") }
print("\n")


print("Print out all of the multiples of 3 from 1 to 30 using a Range and a where statement. Print out on the same line the tuple of 20,Mar,2019, w/ each field separated by \"/\".")
for i in 1 ... 30 where i % 3 == 0 {
  print("\(i) ", terminator:"")
}
let date = (20, "Mar", 2019)
let myself = Mirror(reflecting: date)
for val in myself.children { print("\(val.value)", terminator:"/") }
print("\n\n")


print("Write a function that prints out a table of conversions from Fahrenheit to Celsius, from -50 F to 150 F, in steps of 10 degrees Fahrenheit. Each line should have the Fahrenheit temperature and the corresponding Celsius temperature. Write the program using functions.")
func f2c_temp_table(start: Double, stop: Double, step: Double) {
  for temp in stride(from: start, to: stop, by: step) {
    print("\(String(format: "%6.2f", temp)) F  is  \(String(format: "%6.2f", round(5.0/9 * (temp - 32.0)))) C")
  }
  print("\n")
}
f2c_temp_table(start: -50.0, stop: 150.0, step: 10.0)


print("Write a function that that prints a greeting, but returns a Void.")
func greet(_ name: String) -> Void {
  print("hello, \(name)")
  return
}
greet("Decimus Maximus Meridius")
print("\n\n")

  
print("Write a function that takes two ints, and returns the sum.")
func sum_two_ints(_ a: Int, _ b: Int) -> Int {
  return a + b
}
let a = 10, b = 20
print("\(a) + \(b) = \(sum_two_ints(a, b))\n\n")
  
  
print("Write a function that converts Fahrenheit temperatures to Celsius (C = 5/9.0 * (F – 32).")
func fahr_to_cels(_ fahr: Double) -> Double {
  return 5/9.0 * (fahr - 32.0)
}
let freezing : Double = 32.0
let boiling : Double = 212.0
print("\(freezing) F = \(fahr_to_cels(freezing)) C, and \(boiling) F = \(fahr_to_cels(boiling)) C\n\n")

  
print("Write a function that takes a list of ints, and returns a list of numbers that are multiples of 3.")
func mults_of_three(_ numbers: [Int]) -> [Int] {
  var mults = [Int]()
  for i in numbers {
    if i % 3 == 0 { mults.append(i) }
  }
  return mults
}
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print("multiples of three in \(numbers) is \(mults_of_three(numbers)))\n\n")

  
print("Write a function that takes a variable number of integers, and returns a tuple containing (minimum: Int, maximum: Int).")
func minmax(_ numbers: Int...) -> (min: Int, max: Int) {
  var min = numbers[0]
  var max = min
  for i in numbers {
    min = i < min ? i : min
    max = i > max ? i : max
  }
  return (min, max)
}
print("(min, max) of 1,2,4,5,6,7,8 is: \(minmax(1,2,3,4,5,6,7,8))\n\n")

  
print("Create an Optional String variable that contains the '666'. Write the code that optionally unwraps that, and if successful,  create an optional Int that converts it to an Int.")
var opt : String? = "666"
if let unwrapped = Int(opt!) {
  print("\'\(opt)\' unwrapped is: \(unwrapped)")
}
print("\n")

  
print("Given the following Sets: var any = [\"one\", \"two\", \"three\"], \nand var evens = [\"two\", \"four\", \"six\"]...")
print("Create a Set that contains all items from both Sets.")
var any = Set<String>(["one", "two", "three", "four"])
var evens = Set<String>(["two", "four", "six", "eight"])
print(any.union(evens), "\n\n")

  
print("Create a Set that contains all of the items that are not in common.")
print(any.symmetricDifference(evens), "\n\n")

  
print("Create a Dictionary of 3 US states, and 2 cities from each state. Then, print out all of the cities from the Dictionary.")
var citystate = [String : String]()
citystate["Sacramento"] = "CA";
citystate["Los Angeles"] = "CA"
citystate["Honolulu"] = "HI";
citystate["Hilo"] = "HI"
citystate["New York City"] = "NY";
citystate["Albany"] = "NY"
print(citystate)
for city in citystate.keys.sorted(by: { $0 < $1 }) { print(city, terminator:" ") }
print("\n\n")

  
print("Make an Array of seven Strings, and search for a String in that Array. Write code that will print out the index of that String if found, or that prints out 'nil' if it is not.\n")
var states : [String] = ["AK", "AL", "CA", "CT", "DE", "FL", "GA"]
let state = "CA"
if let idx = states.firstIndex(of: state) { print("'\(state)' has index: \(idx)")
} else { print("'\(state)' was not found") }
print("\n")

  
print("Make an array of several Strings, and IN ONE LINE, write the code that prints them out in reverse, each on its own line.")
var dogs = ["wire fox terrier", "pug", "labrador retriever", "poodle", "irish terrier", "irish wolfhound", "doberman"]
print("\(dogs) sorted in descending order is: \((dogs.sorted{ $0 > $1 }).joined(separator: "\n"))\n\n")


print("Write a function called siftBeans(fromGroceryList:) that takes a grocery list (as an array of strings) and 'sifts out' the beans from the other groceries. The function should take one argument that has a parameter name called list, and it should return a named tuple of the type (beans: [String], otherGroceries: [String]).\nHere is an example of how you to call your function and what the result should be:\nlet result = siftBeans(fromGroceryList: [\'green beans\', 'milk', 'black beans', 'pinto beans', 'apples'])\nHere is an example of how you should be able to call your function and its result)\n// output\nresult.beans == [\"green beans\", \"black beans\", \"pinto beans\"]\n// result.otherGroceries == [\"milk\", \"apples\"]\n")
print("Hint: You may need to use a function on the String type called hasSuffix(_:).\n")
func siftBeans(_ fromGroceryList: [String]) -> (beans: [String], notbeans: [String]) {
    var beans = [String]()
    var notbeans  = [String]()
    for item in fromGroceryList {
      if (item.hasSuffix("beans")) { beans.append(item) }
      else { notbeans.append(item) }
    }
    return (beans, notbeans)
}
print("================================================== running function siftBeans()...")
let result = siftBeans(["green beans", "milk", "black beans", "pinto beans", "apples"])
print("result.beans = \(result.beans)")
print("result.notbeans = \(result.notbeans)\n")
print("================================================== running function siftBeans()...\n\n")

  
print("Write a function that divides a list of words into those before a given dividing String, and those equal or after to that String.\n")
print("let divided = partitionStrings([\"at\", \"be\", \"cat\", \"dog\", \"fox\", \"lima\", \"snake\", \"yak\"], \nbyDivisor: \"goat\")\nprint(divided)\n\n//output\n(before: [\"at\", \"be\", \"cat\", \"dog\", \"fox\"], equalAndAfter: [\"lima\", \"snake\", \"yak\"])\n\n//Hint: You may find the following function helpful\nfunc sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {\n\tvar evens = [Int]()\n\tvar odds = [Int]()\n\tfor number in numbers {\n\t\tif number % 2 == 0 { evens.append(number);\n\t\t} else { odds.append(number) }\n\t}\n\treturn (evens, odds)\n}")
func partitionStrings(_ strings: [String], byDivisor: String)
      -> (before: [String], equalAndAfter: [String]) {
  var before = [String]()
  var equalAndAfter  = [String]()
  for string in strings {
    if (string < byDivisor) { before.append(string);
    } else { equalAndAfter.append(string) }
  }
  return (before, equalAndAfter)
}

print("================================================== running function partitionStrings()...")
let divided = partitionStrings(["at", "be", "cat", "dog", "fox", "lima", "snake", "yak"], byDivisor: "goat")
print(divided)
print("================================================== running function partitionStrings()...\n\n")

