//
//  Created by Pete Callaway on 26/06/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

import UIKit


class ESPresentationController: UIPresentationController {

    lazy var dimmingView :UIView = {
        let view = UIView(frame: self.containerView!.bounds)
        view.backgroundColor = UIColor.blackColor()
        view.alpha = 0.0
        return view
    }()
    
    var popupWidth:Double
    var popupHeight:Double
    
    init(presentedViewController: UIViewController, presentingViewController: UIViewController, popupWidth:Double, popupHeight:Double) {
        self.popupWidth=popupWidth
        self.popupHeight=popupHeight
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        
    }
    
    
    override func presentationTransitionWillBegin() {

		guard
			let containerView = containerView,
			let presentedView = presentedView()
		else {
			return
		}

        dimmingView.frame = containerView.bounds
        containerView.addSubview(dimmingView)
        containerView.addSubview(presentedView)

        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.dimmingView.alpha = 0.5
            }, completion:nil)
        }
    }

    override func presentationTransitionDidEnd(completed: Bool)  {

        if !completed {
            self.dimmingView.removeFromSuperview()
        }
    }

    override func dismissalTransitionWillBegin()  {

        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.dimmingView.alpha  = 0.0
            }, completion:nil)
        }
    }

    override func dismissalTransitionDidEnd(completed: Bool) {

        if completed {
            self.dimmingView.removeFromSuperview()
        }
    }

    override func frameOfPresentedViewInContainerView() -> CGRect {

		guard
			let containerView = containerView
		else {
			return CGRect()
		}

        var frame = containerView.bounds;
        let centerX=frame.size.width/2
        let centerY=frame.size.height/2
        frame=CGRectMake(centerX-CGFloat(popupWidth/2), centerY-CGFloat(popupHeight/2), CGFloat(popupWidth), CGFloat(popupHeight))
        return frame
    }


    // ---- UIContentContainer protocol methods

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator transitionCoordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: transitionCoordinator)

		guard
			let containerView = containerView
		else {
			return
		}

        transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            self.dimmingView.frame = containerView.bounds
        }, completion:nil)
    }
}
