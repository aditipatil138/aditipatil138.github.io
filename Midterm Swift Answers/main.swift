///
//  main.swift
//  midterm
//
//  Created by William McCarthy on 163//20.
//  Copyright © 2020 William McCarthy. All rights reserved.
//

import Foundation

//================================================================================
// PREFACE to the TEST
//================================================================================

var highest_score = 100.0
var nQuestion = 1

func no_answer() {
  highest_score -= 2.5
  print("NO ANSWER -- highest possible now \(highest_score)%\n\n\n")
}

func separator() {  print("//=================================================================================");
}

func header(label: String) {
  separator();
  print("//\(label)");
  separator();
}

func question(_ n: inout Int, text: String) {
  separator();
  print("// Question \(n)\n//");
  print("// \(text)\n//")
  n += 1
  separator();
}


//================================================================================
// TEST BEGINS.............
//================================================================================


question(&nQuestion,        //  ------------------- QUESTION 1 -----------------
         text: "Write out the formula for reversing the String 'Call me Ishmael'.")
var ish = "Call me Ishmael"
print(String(ish.reversed()) + "\n\n")


print("\n\n");



question(&nQuestion,        //  ------------------- QUESTION 2 -----------------
         text: "Print 'China' using its two unicode chars: unicode 4e2d and 570d")

print("\u{4e2d}\u{570d}" + "\n\n")

print("\n\n")




question(&nQuestion,        //  ------------------- QUESTION 3 -----------------4
         text: "Convert the following String to all uppercase: 'cal state fullerton'.")

print("cal state fullerton".uppercased() + "\n\n")

print("\n\n")



question(&nQuestion,        //  ------------------- QUESTION 4 -----------------
         text: "Change all of the vowels (a,e,i,o,u, and y) to be ‘Z’.")
let word = "sUpErcAlifragilisticexpialadotiOUs"
let newword = word.replacingOccurrences(of: "[aeiouy]", with: "Z", options: [.regularExpression, .caseInsensitive], range: nil)
print("newword is: \(newword) \n\n")

print("\n\n")




question(&nQuestion,        //  ------------------- QUESTION 5 -----------------
         text: "Determine if the following String has the prefix or suffix '__': __add__.")
var sadd = "__add__"
let pre = "__"
let prefix = sadd.hasPrefix(pre)
print("\(sadd) has prefix \(pre) is: \(prefix ? "YES" : "no")" + "\n\n")

print("\n\n")




question(&nQuestion,        //  ------------------- QUESTION 6 -----------------
         text: "Create a switch statement that handles the following ranges of error codes:\n100 or 101: \"Informational, 1xx\"\n204: \"Successful but no content, 204\"\n300 to 307: \"Redirection: 3xx\"\n400 to 505: \"Server error\"\notherwise: \"Unknown error. Please retry\"")
func handleError(_ code: Int) {
  print("handling error code: \(code)... ===> ", terminator: " ")
  switch(code) {

  case 100,101: print("Informational, 1xx")
  case 204: print("Successful but not content, 204")
  case 300...307: print("Redirection: 3xx")
  case 400...505: print("Server error")
  default: print("Unknown Error");
  }
}
print("\n")
handleError(101)
handleError(204)
handleError(303)
handleError(306)
handleError(500)
handleError(600)
print("\n\n")




question(&nQuestion,        //  ------------------- QUESTION 7 -----------------
         text: "Write a function that takes a variable number of integers, and returns a tuple containing (minimum: Int, maximum: Int).")
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




question(&nQuestion,        //   ------------------- QUESTION 8 -----------------
         text: "Write a function called siftBeans(fromGroceryList:) that takes a grocery list [String], and splits it into two lists, one with beans, and one without. Example: let result = siftBeans(fromGroceryList: [\'green beans\', 'milk', 'black beans', 'pinto beans',  'apples'])      result.beans == [\"green beans\", \"black beans\", \"pinto beans\"]    result.otherGroceries == [\"milk\", \"apples\"]    Hint:  use hasSuffix(_:).\n")
func siftBeans(_ fromGroceryList: [String]) -> (beans: [String], notbeans: [String]) {

    var beans = [String]()
    var notbeans  = [String]()
    for item in fromGroceryList {
      if (item.hasSuffix("beans")) { beans.append(item) }
      else { notbeans.append(item) }
    }
  return (beans,notbeans)
}
print("\nrunning function siftBeans()...")
let result = siftBeans(["green beans", "milk", "black beans", "pinto beans", "apples"])
print("result.beans = \(result.beans)")
print("result.notbeans = \(result.notbeans)\n")
