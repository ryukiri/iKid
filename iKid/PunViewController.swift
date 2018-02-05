//
//  PunViewController.swift
//  iKid
//
//  Created by Austin Quach on 2/4/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class PunViewController: UIViewController {

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
    
    fileprivate var punView : PunViewController!
    @IBOutlet weak var punNextButton: UIButton!
    var side = 0
    @IBOutlet weak var punLabel: UILabel!
    @IBOutlet weak var punLabel2: UILabel!
    @IBOutlet weak var punLabel3: UILabel!
    
    fileprivate func punBuilder() {
        if punView == nil {
            punView =
                storyboard?
                    .instantiateViewController(withIdentifier: "punView")
                as! PunViewController
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
        punBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if (side == 0) {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            punView.view.frame = view.frame
            punLabel.text = "You have my Word."
            punLabel2.text = ""
            punLabel3.text = ""
            punNextButton.setTitle("Back", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 1
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punView.view.frame = view.frame
            punLabel.text = "Whoever stole my copy"
            punLabel2.text = "of Microsoft Office is"
            punLabel3.text = "in big trouble."
            punNextButton.setTitle("Next", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 0
        }
    }
    
}
