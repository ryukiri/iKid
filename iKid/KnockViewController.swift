//
//  KnockViewController.swift
//  iKid
//
//  Created by Austin Quach on 2/5/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class KnockViewController: UIViewController {

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
    
    fileprivate var knockView : KnockViewController!
    @IBOutlet weak var knockLabel: UILabel!
    @IBOutlet weak var knockNextButton: UIButton!
    var side = 0
    
    fileprivate func knockBuilder() {
        if knockView == nil {
            knockView =
                storyboard?
                    .instantiateViewController(withIdentifier: "knockView")
                as! KnockViewController
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
        knockBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if (side == 0) {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            knockView.view.frame = view.frame
            knockLabel.text = "Who's there?"
            knockNextButton.setTitle("Next", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 1
        } else if (side == 1) {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            knockView.view.frame = view.frame
            knockLabel.text = "A broken pencil"
            knockNextButton.setTitle("Next", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 2
        } else if (side == 2) {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            knockView.view.frame = view.frame
            knockLabel.text = "A broken pencil who?"
            knockNextButton.setTitle("Next", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 3
        } else if (side == 3) {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            knockView.view.frame = view.frame
            knockLabel.text = "Nevermind. It's pointless."
            knockNextButton.setTitle("Reset", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 4
        } else if (side == 4) {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            knockView.view.frame = view.frame
            knockLabel.text = "Knock Knock"
            knockNextButton.setTitle("Next", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 0
        }
    }
}
