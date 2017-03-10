//
//  UIColor+extension.swift
//  Pseufari
//
//  Created by Stuart Slack on 10/7/15.
//  Copyright © 2015 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    convenience init (R: Int, G: Int, B: Int)
    {
        //     public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
        self.init( red:CGFloat(R)/255.0, green:CGFloat(G)/255.0, blue:CGFloat(B)/255.0, alpha: 0.7);
    }
}


