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
for item in stack {
    let tmp = stack.peek() as? SomeClass
    if let a = tmp {
        print(tmp!.classNumber)
    }
}
print(stack.count)
_ = stack.pop()
print(stack.count)
print("=========")
var pStack:PriorityStack<Int> = PriorityStack(Length: 5)
pStack.push(1)
pStack.push(5)
pStack.push(2)
pStack.push(8)
pStack.push(100)
pStack.push(999999)
pStack.push(0)
print(pStack.maxLength)
print("---")
for item in pStack {
    print(item)
}
let list:[Int] = pStack.map{return $0}
print(list)


    
