//
//  Created by Pete Callaway on 26/06/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

import UIKit


class ESPresentationAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    let isPresenting :Bool
    let duration :NSTimeInterval = 0.5

    init(isPresenting: Bool) {
        self.isPresenting = isPresenting

        super.init()
    }


    // ---- UIViewControllerAnimatedTransitioning methods

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return self.duration
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning)  {
        if isPresenting {
            animatePresentationWithTransitionContext(transitionContext)
        }
        else {
            animateDismissalWithTransitionContext(transitionContext)
        }
    }


    // ---- Helper methods

    func animatePresentationWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {

        guard
            let presentedController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
			let presentedControllerView = transitionContext.viewForKey(UITransitionContextToViewKey),
            let containerView = transitionContext.containerView()
        else {
            return
        }

        presentedControllerView.frame = transitionContext.finalFrameForViewController(presentedController)
        containerView.addSubview(presentedControllerView)

        // Animate the presented view to it's final position
        presentedControllerView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        UIView.animateWithDuration(self.duration, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [.CurveEaseOut], animations: {
            presentedControllerView.transform = CGAffineTransformMakeScale(1, 1)
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }

    func animateDismissalWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {

        guard
            let presentedControllerView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        else {
            return
        }
        
        UIView.animateWithDuration(self.duration, delay: 0.0, options: [.CurveEaseIn], animations: {
            presentedControllerView.transform = CGAffineTransformMakeScale(0.1, 0.1)
            presentedControllerView.alpha = 0.0
        }) { (completed) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
