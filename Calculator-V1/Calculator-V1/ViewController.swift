//
//  ViewController.swift
//  Calculator-V1
//
//  Created by Stuart Slack on 2/2/15.
//  Copyright © 2015 Apple. All rights reserved.
//

import UIKit

let numFormatter = NSNumberFormatter()
// Adds new functionality to Swift's String class
extension String {
    
    func toDouble() -> Double? {
        return numFormatter.numberFromString(self)!.doubleValue
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTypingANumber = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        println("digit = \(digit)")
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit;
        }
        else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton)
    {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        switch operation {
        case "×":
            performOperation( { ( opt1:Double, opt2:Double ) -> Double in
                return opt1 * opt2;
                })
        case "÷":
            performOperation() {$1 / $0}
        case "−":
            performOperation( { ( opt1, opt2 ) in return opt2 - opt1})
        case "+": performOperation() {$0 + $1}
        case "√": performOperation1 {sqrt($0)}
            
        default: break
        }
    }
    func performOperation( operation:(Double, Double) -> Double ) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast() )
            enter()
        }
    }
    
    func performOperation1( operation:Double -> Double ) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter()
    {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(self.displayValue)

        println("operandStack = \(operandStack)")
        
    }
    
    var displayValue: Double {
        get {
            var strNum = display.text!
            var nsstrNum = (strNum as NSString)
            var dVal = nsstrNum.doubleValue
            return dVal;
//            return NSNumberFormatter().numberFromString(strNum)!.doubleValue
//            return display.text!.toDouble()!
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
}

