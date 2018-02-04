//
//  GoodViewController.swift
//  iKid
//
//  Created by Austin Quach on 2/4/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class GoodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    fileprivate var goodView : GoodViewController!
    
    fileprivate func goodBuilder() {
        if goodView == nil {
            goodView =
                storyboard?
                    .instantiateViewController(withIdentifier: "goodView")
                as! GoodViewController
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
        goodBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if goodView != nil &&
            goodView?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodView.view.frame = view.frame
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            goodView.view.frame = view.frame
        }
        UIView.commitAnimations()
    }
    
}
