//
//  PriorityStack.swift
//  Stack in Swift
//
//  Created by R0uter on 2017/2/14.
//  Copyright © 2017年 R0uter. All rights reserved.
//

import Foundation
//Element must comparable

class PriorityStack_ArrayBackEnd<Element:Comparable> {
    fileprivate var items:[Element] = []
    let maxLength:Int
    
    init(Length length:Int) {
        maxLength = length
        items.reserveCapacity(length+5)
    }
    var count = 0
    
    func push(_ newElement:Element) {
        
        
        if maxLength == count && newElement < items.last! {
            return
        }
        
        if isEmpty {
            items.append(newElement)
            count += 1
            return
            
        }
        
        var middleIndex = Int(count/2)
        if newElement > items[middleIndex] {
            while middleIndex >= 0 {
                
                if newElement > items[middleIndex] {
                    if middleIndex == 0 {items.insert(newElement, at: 0);break}
                    middleIndex -= 1
                    continue
                }
                
                items.insert(newElement, at: middleIndex + 1)
                break
            }
        } else {
            while middleIndex < count {
                
                if newElement < items[middleIndex] {
                    if middleIndex == count - 1 {items.append(newElement);break}
                    middleIndex += 1
                    continue
                }
                items.insert(newElement, at: middleIndex)
                break
            }
        }
        count += 1
        if count > maxLength {items.removeLast();count -= 1}
        
    }
    
    func pop()->Element? {
        guard count > 0 else {return nil}
        count -= 1
        return items.removeFirst()
    }
    var isEmpty:Bool {
        return count == 0
    }
    func peek() ->Element? {
        return items.first
    }
    
}

extension PriorityStack_ArrayBackEnd:Sequence {
    typealias Iterator = IndexingIterator<Array<Element>>
    func makeIterator() -> PriorityStack_ArrayBackEnd.Iterator {
        return items.makeIterator()
    }
}
