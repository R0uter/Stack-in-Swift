//
//  PriorityQueue.swift
//  Stack in Swift
//
//  Created by R0uter on 6/3/19.
//  Copyright © 2019 R0uter. All rights reserved.
//

import Foundation
private class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

class PriorityStack_LinkedListBackend<Element: Comparable> {
    fileprivate typealias Node = LinkedListNode<Element>
    
    let maxLength: Int
    
    private(set) var count = 0
    init(Length length: Int) {
        maxLength = length
    }
    
    fileprivate var headNode: Node!
    fileprivate weak var middleNode: Node!
    fileprivate var endNode: Node!
    
    var middleBalance = 0 // left - right +
    
    func push(_ newElement: Element) {
        if maxLength == count, newElement < endNode!.value {
            return
        }
        
        guard !isEmpty else {
            let newNode = Node(value: newElement)
            headNode = newNode
            middleNode = newNode
            endNode = newNode
            count = 1
            return
        }
        
        if newElement > middleNode.value {
            var node = middleNode.previous
            while node != nil {
                guard newElement <= node!.value else {
                    node = node!.previous
                    continue
                }
                insertAfter(node!, withElement: newElement)
                break
            }
            if node == nil {
                insertBefore(headNode, withElement: newElement)
            }
            middleBalance -= 1
            
        } else {
            var node = middleNode.next
            while node != nil {
                guard newElement > node!.value else {
                    node = node!.next
                    continue
                }
                insertBefore(node!, withElement: newElement)
                break
            }
            if node == nil {
                insertAfter(endNode, withElement: newElement)
            }
            middleBalance += 1
        }
        count += 1
        if count > maxLength {
            removeLast()
        }
        balance()
    }
    
    func pop() -> Element? {
        guard count > 0, let node = headNode else { return nil }
        headNode = headNode.next
        count -= 1
        middleBalance += 1
        balance()
        return node.value
    }
    
    var isEmpty: Bool { return count == 0 }
    func peek() -> Element? {
        return headNode?.value
    }
    
    fileprivate weak var currentIteratorItem: Node?
}

extension PriorityStack_LinkedListBackend: Sequence {
    __consuming func makeIterator() -> PriorityStack_LinkedListBackend<Element>.PriorityStackIterator<Element> {
        return PriorityStackIterator(firstNode: headNode)
    }
    
    typealias Iterator = PriorityStackIterator<Element>
    
    class PriorityStackIterator<T>: IteratorProtocol {
        typealias Element = T
        fileprivate var currentNode: LinkedListNode<Element>?
        
        func next() -> T? {
            let a = currentNode
            currentNode = currentNode?.next
            return a?.value
        }
        
        fileprivate init(firstNode: LinkedListNode<Element>?) {
            currentNode = firstNode
        }
    }
}

extension PriorityStack_LinkedListBackend {
    fileprivate func insertAfter(_ node: Node, withElement element: Element) {
        let newNode = Node(value: element)
        if node.next == nil { endNode = newNode }
        node.next?.previous = newNode
        newNode.previous = node
        newNode.next = node.next
        node.next = newNode
    }
    
    fileprivate func insertBefore(_ node: Node, withElement element: Element) {
        let newNode = Node(value: element)
        if node.previous == nil { headNode = newNode }
        node.previous?.next = newNode
        newNode.previous = node.previous
        newNode.next = node
        node.previous = newNode
    }
    
    fileprivate func removeLast() {
        endNode = endNode.previous
        endNode.next = nil
        count -= 1
        middleBalance -= 1
        balance()
    }
    
    fileprivate func balance() {
        if middleBalance >= 2, middleNode.next != nil {
            middleBalance = 0
            middleNode = middleNode.next
        }
        if middleBalance <= -2, middleNode.previous != nil {
            middleBalance = 0
            middleNode = middleNode.previous
        }
    }
}
