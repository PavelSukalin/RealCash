//
//  SequeToRight.swift
//  RealCasino
//
//  Created by Pavel Sukalin on 8/3/16.
//  Copyright © 2016 Pavel Sukalin. All rights reserved.
//

import UIKit

class SequeToRight: UIStoryboardSegue {
    
    override func perform() {
        let src: UIViewController = self.sourceViewController
        let dst: UIViewController = self.destinationViewController
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.duration = 0.25
        transition.timingFunction = timeFunc
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        src.navigationController!.view.layer.addAnimation(transition, forKey: kCATransition)
        src.navigationController!.pushViewController(dst, animated: false)
    }
    
}