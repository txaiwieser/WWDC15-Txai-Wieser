//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

for i in 0 ..< 100 {
    
    // To get a random feeling but still get the same value for every position i'm using PI digits!
    let number = CGFloat(M_PI)
    let mod = pow(10, CGFloat(i))
    
    let final = Int((number*mod)%10)
    
}
