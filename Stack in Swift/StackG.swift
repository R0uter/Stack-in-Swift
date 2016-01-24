//
//  StackG.swift
//  Stack in Swift
//
//  Created by R0uter on 16/1/24.
//  Copyright © 2016年 R0uter. All rights reserved.
//

import Foundation

struct StackG<Element> {
    private var items = [Element]()
    mutating func push(item:Element) {
        items.append(item)
    }
    mutating func pop() ->Element? {
        return items.removeLast()
    }
    func empty() -> Bool {
        return items.isEmpty
    }
    func peek() ->Element? {
        return items.last
    }
}