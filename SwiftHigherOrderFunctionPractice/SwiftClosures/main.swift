//
//  main.swift
//  SwiftHigherOrderFunctionPractice
//
//  Created by Ankita Kalangutkar on 09/04/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation

print("Hello, World!")

let unsortedArray = [3, 6, 1, 2, 0, 90, 56]
let sortedElements =  unsortedArray.sorted(by: sortElements(_:_:))
print(sortedElements)


let arr = [12, 34, 45]
print(digitString(arr))

getElements(for: 1) { (elements) in
    
}

closureCaptureValue()



let person = Person()
person.setName()
