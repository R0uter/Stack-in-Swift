//
//  PriorityStack.swift
//  Stack in Swift
//
//  Created by R0uter on 2017/2/14.
//  Copyright © 2017年 R0uter. All rights reserved.
//

import Foundation
//Element must comparable

struct PriorityStack<Element:Comparable> {
    fileprivate var items:[Element] = []
    let maxLength:Int
    
    init(Length length:Int) {
        maxLength = length
    }
    mutating func push(_ newElement:Element) {
        if maxLength == count && newElement < items.last! {
            return
        }
        if items.isEmpty {items.append(newElement);return}
        var middleIndex = Int(count/2)
        if newElement > items[middleIndex] {
            while middleIndex >= 0 {
                
                if newElement > items[middleIndex] {
                    if middleIndex == 0 {items.insert(newElement, at: 0)}
                    middleIndex -= 1
                    continue
                }
                
                items.insert(newElement, at: middleIndex + 1)
                break
            }
        } else {
            while middleIndex < count {
                
                if newElement < items[middleIndex] {
                    if middleIndex == count - 1 {items.append(newElement)}
                    middleIndex += 1
                    continue
                }
                items.insert(newElement, at: middleIndex)
                break
            }
        }
        if count > maxLength {items.removeLast()}
        
    }
    
    mutating func pop()->Element? {
        guard count > 0 else {return nil}
        return items.removeFirst()
    }
    func empty() -> Bool {
        return items.isEmpty
    }
    func peek() ->Element? {
        return items.last
    }
    var count:Int {
        return items.count
    }
    
}

extension PriorityStack:Sequence {
    typealias Iterator = IndexingIterator<Array<Element>>
    func makeIterator() -> PriorityStack.Iterator {
        return items.makeIterator()
    }
}
