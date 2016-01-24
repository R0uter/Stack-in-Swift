//
//  Stack.swift
//  Stack in Swift
//
//  Created by R0uter on 16/1/24.
//  Copyright © 2016年 R0uter. All rights reserved.
//

import Foundation

class Stack {
    private var items = [Any]()
    func push(item:Any) {
        items.append(item)
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
}