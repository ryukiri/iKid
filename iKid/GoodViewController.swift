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
    
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var goodLabel2: UILabel!
    @IBOutlet weak var goodLabel3: UILabel!
    @IBOutlet weak var goodLabel4: UILabel!
    @IBOutlet weak var goodLabel5: UILabel!
    @IBOutlet weak var goodLabel7: UILabel!
    
    var side = 0
    
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
            goodLabel.text = "An hour later,"
            goodLabel2.text = "he returns from the store"
            goodLabel3.text = "with a dozen loaves"
            goodLabel4.text = "of bread."
            goodLabel5.text = ""
            goodLabel7.text = ""
            goodNextButton.setTitle("Back", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 1
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodView.view.frame = view.frame
            goodLabel.text = "A computer programmer's"
            goodLabel2.text = "wife sends her husband"
            goodLabel3.text = "to the store."
            goodLabel4.text = "She says, \"Buy a loaf of"
            goodLabel5.text = "bread. If they have eggs, get"
            goodLabel7.text = "a dozen\""
            goodNextButton.setTitle("Next", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 0
        }
    }
    
}
