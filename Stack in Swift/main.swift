//
//  main.swift
//  Stack in Swift
//
//  Created by R0uter on 16/1/24.
//  Copyright © 2016年 R0uter. All rights reserved.
//

import Foundation

class SomeClass {
    var classNumber = 0
    init (number:Int) {
        classNumber = number
    }
}


var GVersionStack = StackG<SomeClass>()
let stack = Stack()

let a = SomeClass(number: 1)
let b = SomeClass(number: 2)
let c = SomeClass(number: 3)

GVersionStack.push(a)
GVersionStack.push(c)
GVersionStack.push(b)
print(GVersionStack.peek()!.classNumber)

stack.push(1)
stack.push(a)
stack.push("abcd")
while(!stack.empty()) {
    let tmp = stack.peek() as? SomeClass
    if let a = tmp {
        print(tmp!.classNumber)
    }
        stack.pop()
    
}