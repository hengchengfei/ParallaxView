//
//  ViewController.swift
//  ParallaxViewExample
//
//  Created by Łukasz Śliwiński on 09/05/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import UIKit
import ParallaxView

class CustomParallaxView: ParallaxView {

}

class ViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var parallaxView: CustomParallaxView! {
        didSet {
            // Configure shadow
            parallaxView.layer.shadowRadius = 20
            parallaxView.layer.shadowColor = UIColor.blackColor().CGColor
            parallaxView.layer.shadowOffset = CGSize(width: 0, height: 40)
            parallaxView.layer.shadowOpacity = 0.5

            parallaxView.cornerRadius = 10

            // Configure glow of the parallax view
            let glowEffectView = UIView(frame: parallaxView.bounds)
            parallaxView.insertSubview(glowEffectView, belowSubview: logoView)
            parallaxView.parallaxEffectOptions.glowAlpha = 0.25
            parallaxView.parallaxEffectOptions.glowContainerView = glowEffectView
        }
    }

    @IBOutlet weak var logoView: UIView!

    @IBOutlet weak var biggerLabel: UILabel!

    @IBOutlet weak var theBiggestLabel: UILabel!

    var testView: ParallaxView?

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        parallaxView.parallaxEffectOptions.subviewsParallaxMode = .BasedOnHierarchyInParallaxView(maxParallaxOffset: 20, multipler: nil)

        // Uncomment lines below to test out subviews parallax effect based on tag
//        parallaxView.parallaxEffectOptions.subviewsParallaxMode = .BasedOnTag
//        logoView.tag = 10
//        biggerLabel.tag = 20
//        theBiggestLabel.tag = 30
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        testView = ParallaxView(frame: CGRect(x: view.frame.width/2, y: 100, width: 200, height: 200))
        testView?.backgroundColor = UIColor.greenColor()
        testView!.parallaxViewActions.setupFocusedState = { (view) in
            view.backgroundColor = UIColor.redColor()
        }
        view.addSubview(testView!)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        testView?.removeFromSuperview()
        testView = nil
    }

}
