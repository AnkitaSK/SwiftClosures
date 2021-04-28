//
//  DemoOnClosures.swift
//  SwiftHigherOrderFunctionPractice
//
//  Created by Ankita Kalangutkar on 28/04/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation


func sortElements<Element: Comparable>(_ e1: Element, _ e2: Element) -> Bool {
  return e1 < e2
}


// 2. convert int to string array using
// arr = [12, 34, 45] o/p = [OneTwo, ThreeFour, FourFive]

func digitString(_ arr: [Int]) -> [String] {
    let digitToString = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
    let ans = arr.map { (number) -> String in
        var num = number
        var outPut = ""
        while num > 0 {
            outPut = digitToString[num % 10]! + outPut
            num = num / 10
        }
        return outPut
    }
    return ans
}

func getElements(for id: Int, completion completionBlock: ([Int]) -> Void) {
}


func closureCaptureValue() {
    var value = "Cat"
    closure(value)
    value = "Dog"
}



let closure = { (val) in
   print(val)
}

let var1 = closure
let var2 = var1

class Person {
    var name: String?
    var address: String?
    
    func getUserInfo(closure: @escaping () -> Void) {
        let address = Address()
        address.findAddress()
        address.completion = { userAddress in
            self.address = userAddress
            closure()
        }
    }
    
    func setName() {
        self.getUserInfo { [weak self] in
            self?.name = "test"
        }
    }
}

class Address {
    var completion: ((String) -> Void)?
    
    func findAddress() {
        completion?("MagazinStrasse")
    }
}

class Person2 {
    var name: String?
    var address: String?

    func getUserInfo(closure: @escaping () -> Void) {
        let address = Address2()
        address.findAddress { userAddress in
            self.address = userAddress
            closure()
        }
    }

    func setName() {
        self.getUserInfo { [weak self] in
            self?.name = "test"
        }
    }
}

class Address2 {
    func findAddress(completion: (String) -> Void) {
        completion("MagazinStrasse")
    }
}


