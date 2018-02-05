//
//  DadViewController.swift
//  iKid
//
//  Created by Austin Quach on 2/4/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class DadViewController: UIViewController {

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

    fileprivate var dadView : DadViewController!
    @IBOutlet weak var dadLabel: UILabel!
    @IBOutlet weak var dadLabel2: UILabel!
    
    @IBOutlet weak var dadNextButton: UIButton!
    var side = 0
    
    fileprivate func dadBuilder() {
        if dadView == nil {
            dadView =
                storyboard?
                    .instantiateViewController(withIdentifier: "dadView")
                as! DadViewController
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
        dadBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if (side == 0) {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            dadView.view.frame = view.frame
            dadLabel.text = "Carlos."
            dadLabel2.text = ""
            dadNextButton.setTitle("Back", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 1
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadView.view.frame = view.frame
            dadLabel.text = "What do you call a"
            dadLabel2.text = "Mexican who lost his car?"
            dadNextButton.setTitle("Next", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 0
        }
    }
}
