//: Playground - noun: a place where people can play

import Foundation
import CoreGraphics
import UIKit


func replaceNSValueConstant(fromValue oldValue: AnyObject, toValue newValue: AnyObject) {
    let oldValuePtr = Unmanaged.passUnretained(oldValue).toOpaque()
    let newValuePtr = Unmanaged.passUnretained(newValue).toOpaque()
    memmove(oldValuePtr+MemoryLayout<NSValue>.size+MemoryLayout<CGPoint>.size, newValuePtr+MemoryLayout<NSValue>.size+MemoryLayout<CGPoint>.size, MemoryLayout<CGFloat>.size * 2)
    
}


let oldPoint = CGPoint(x: 1, y: 1)
let newPoint = CGPoint(x: 3, y: 3)

let oldValue = NSValue(cgPoint: oldPoint)
let newValue = NSValue(cgPoint: newPoint)

replaceNSValueConstant(fromValue: oldValue, toValue: newValue)

oldValue.cgPointValue
newValue.cgPointValue
