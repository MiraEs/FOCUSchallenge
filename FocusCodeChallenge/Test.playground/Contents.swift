//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let defaults = UserDefaults.standard
let test = "testDict"
let value: [String: String] = [
    "name": "blah",
    "age": "blah",
    "weight": "blah"
]
let leCrap = "crap"
defaults.setValue(value, forKeyPath: test)
defaults.set(leCrap, forKey: "crap")

let outputDict = defaults.object(forKey: test)

let crap = defaults.string(forKey: "crap")




