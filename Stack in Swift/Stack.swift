//
//  Stack.swift
//  Stack in Swift
//
//  Created by R0uter on 16/1/24.
//  Copyright © 2016年 R0uter. All rights reserved.
//

import Foundation

class Stack {
    fileprivate var items:[Any] = []
    func push(_ newElement:Any) {
        items.append(newElement)
    }
    func pop() ->Any? {
        return items.removeLast()
    }
    func empty() -> Bool {
        return items.isEmpty
    }
    func peek() ->Any? {
        return items.last
    }
    var count:Int {
        return items.count
    }
}
extension Stack:Sequence {
    typealias Iterator = IndexingIterator<Array<Any>>
    func makeIterator() -> Stack.Iterator {
        return items.makeIterator()
    }
}
