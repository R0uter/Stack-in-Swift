//
//  StackG.swift
//  Stack in Swift
//
//  Created by R0uter on 16/1/24.
//  Copyright © 2016年 R0uter. All rights reserved.
//

import Foundation

struct Stack<Element> {
    fileprivate var items: [Element] = []
    mutating func push(_ newElement: Element) {
        items.append(newElement)
    }

    mutating func pop() -> Element? {
        return items.removeLast()
    }

    func empty() -> Bool {
        return items.isEmpty
    }

    func peek() -> Element? {
        return items.last
    }

    var count: Int {
        return items.count
    }
}

extension Stack: Sequence {
    typealias Iterator = IndexingIterator<[Element]>
    func makeIterator() -> Stack.Iterator {
        return items.makeIterator()
    }
}
