//
//  Created by Pete Callaway on 26/06/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

import UIKit


public class ESPopupDialog: UIViewController, UIViewControllerTransitioningDelegate {
    
    public var popupWidth:Double?
    public var popupHeight:Double?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    public init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!, popupWidth:Double, popupHeight:Double)  {
        self.popupWidth=popupWidth
        self.popupHeight=popupHeight
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.commonInit()
    }
    
    func commonInit() {
        self.modalPresentationStyle = .Custom
        self.transitioningDelegate = self
    }
    
    
    // ---- UIViewControllerTransitioningDelegate methods
    
    public func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        if presented == self {
            return ESPresentationController(presentedViewController: presented, presentingViewController: presenting,popupWidth:popupWidth!,popupHeight:popupHeight!)
        }
        
        return nil
    }
    
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if presented == self {
            return ESPresentationAnimationController(isPresenting: true)
        }
        else {
            return nil
        }
    }
    
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if dismissed == self {
            return ESPresentationAnimationController(isPresenting: false)
        }
        else {
            return nil
        }
    }
    
    public func dismissCallback(handler:(Void->Void)){
        dismissViewControllerAnimated(true) { 
            handler()
        }
    }
    
    public func dismiss(){
        dismissViewControllerAnimated(true) {
            
        }
    }
    
}
