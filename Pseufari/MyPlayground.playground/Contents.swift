//: Playground - noun: a place where people can play

import UIKit


var demoURL = "http://apple.com:80"
var fancyURL = "http://apple.com?username=stu&device=iPad"

let theURL = NSURL(string: demoURL)
let theFanceURL = NSURL(string: fancyURL)

// Example of optional chaining
theURL?.host?.uppercaseString
theURL?.port

// Optional unwrapping
if let theURLUnwrapped = theURL {
    let request = NSURLRequest(theURLUnwrapped)
    theURLUnwrapped.port;
}


let str = "Hello, playground"
let firstName = "Stu"
let lastName = "Slack"
let fullName = firstName + " " + lastName + String(2)

let priceOfOneBanana = 0.5 // dollars
let quantityOfBananas:Double = 0

let totalSpentOnBananas = priceOfOneBanana * quantityOfBananas

let isNight = true

if isNight {
    print("Hello")
}

switch( quantityOfBananas) {
case 0 where isNight: print("You have no bananas and it's night")
case 1: print( "You have one banana")
case 2...20: print("You have between 2 and 20")
case 20..<30: print("Less than 30 bananas")
    fallthrough // Falls through to the next one
default: print("You have more than 1 banana")
    
}

enum Animal {
    case Dog
    case Dolphin
    case Giraffe
    case Monkey
    
    func speak(loudly:Bool) -> String {
        var tmp : String
        
        switch self {
        case .Dog : tmp = "woof"
        case .Giraffe : tmp = "Wee"
        case .Dolphin : tmp = "So long and thanks for all the fish"
        case .Monkey :  tmp = "Woop"
        }
        if( loudly ) {
            return tmp.uppercaseString;
        }
        else {
            return tmp;
        }
    }
}

var spot = Animal.Dolphin
var jan = Animal.Monkey

print(spot.speak(true))
print(jan.speak(false))

let word = Animal.Dolphin.speak(true)


