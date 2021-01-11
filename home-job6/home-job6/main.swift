//
//  main.swift
//  home-job6
//
//  Created by Petr Fedoseev on 11.01.2021.
//

import Foundation

struct Journal {
    var name: String
    var volodya: Int
}

extension Journal: CustomStringConvertible {
    var description : String {
        return "Name: \(name), Mark: \(volodya)"
    }
}


struct queue <T> {
    private var elements: [T] = []
    
    public var isEmpty: Bool {
        return elements.count == 0
    }
    
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue()->T {
        return elements.removeLast()
    }
    
    public var head: T? {
        if isEmpty {
            print("The elemnets aren't found. Array is empty.")
            return nil
        } else {
            print("Last element is \(elements.last!)")
            return elements.last
        }
    }
    
    public var front: T? {
        if isEmpty {
            print("The elemnets aren't found. Array is empty.")
            return nil
        } else {
            print("First element is \(elements.first!)")
            return elements.first
        }
    }
    
    func printMyQueue() {
        print(elements)
    }
}

extension queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

var pupil = queue<Journal>()
pupil.enqueue(element: .init(name: "Alice", volodya: 4))
pupil.enqueue(element: .init(name: "John", volodya: 5))
pupil.enqueue(element: .init(name: "Jessie", volodya: 5))
pupil.enqueue(element: .init(name: "Andrea", volodya: 3))
pupil.enqueue(element: .init(name: "Alex", volodya: 4))
pupil.enqueue(element: .init(name: "Timothi", volodya: 3))
pupil.enqueue(element: .init(name: "Sarah", volodya: 4))
pupil.enqueue(element: .init(name: "Pamela", volodya: 3))

pupil.printMyQueue()
pupil.head
pupil.front

let honoursPupil = pupil.myFilter(predicate: {$0.volodya == 5})
print(honoursPupil)

