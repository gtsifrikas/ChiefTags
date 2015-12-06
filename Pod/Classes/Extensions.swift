//
//  File.swift
//  Pods
//
//  Created by George Tsifrikas on 06/12/15.
//
//

import Foundation
import UIKit

extension UIView {
    public func setScale(x x: CGFloat, y: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = CGFloat(1.0) / -1000.0
        transform = CATransform3DScale(transform, x, y, 1)
        self.layer.transform = transform
    }
    
    public func pop() {
        setScale(x: 1.1, y: 1.1)
        spring(duration: 0.2, animations: { [unowned self] () -> Void in
            self.setScale(x: 1, y: 1)
            })
    }
    
    public func spring(duration duration: NSTimeInterval, animations: (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.AllowAnimatedContent, animations: animations, completion: completion)
    }
}