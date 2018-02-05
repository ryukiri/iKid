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
    @IBOutlet weak var goodNextButton: UIButton!
    var side = 0
    @IBOutlet weak var goodTextView: UITextView!
    
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

        if (side == 0) {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            goodView.view.frame = view.frame
            goodTextView.text = "An hour later, he returns home with twelve loaves of bread."
            goodNextButton.setTitle("Back", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 1
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodView.view.frame = view.frame
            goodTextView.text = "A computer programmer's wife sends her husband to the store. She says, \"Buy a loaf of bread. If they have eggs, get a dozen.\""
            goodNextButton.setTitle("Next", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 0
        }
    }
    
}
