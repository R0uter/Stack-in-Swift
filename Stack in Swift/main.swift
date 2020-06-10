//
//  main.swift
//  Stack in Swift
//
//  Created by R0uter on 16/1/24.
//  Copyright © 2016年 R0uter. All rights reserved.
//

import Foundation

var myP = PriorityStack_ArrayBackEnd<Int>(Length: 50)

var date = Date()
for _ in 0...100 {
    let i = Int.random(in: 0...999)
    myP.push(i)
}

print(Date().timeIntervalSince(date) * 1000, "ms")

var p = PriorityStack_LinkedListBackend<Int>(Length: 50)

date = Date()
for _ in 0...100 {
    let i = Int.random(in: 0...999)
    p.push(i)
}

print(Date().timeIntervalSince(date) * 1000, "ms")
