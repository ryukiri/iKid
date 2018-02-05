//
//  ImageViewController.swift
//  iKid
//
//  Created by Austin Quach on 2/5/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    var side = 0
    fileprivate var imageViewController : ImageViewController!
    
    fileprivate func imageBuilder() {
        if imageViewController == nil {
            imageViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "imageView")
                as! ImageViewController
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
        imageBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if (side == 0) {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            imageViewController.view.frame = view.frame
            imageView.image = UIImage(named: "work.png")
            nextButton.setTitle("Back", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 1
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            imageViewController.view.frame = view.frame
            imageView.image = UIImage(named: "noWork.png")
            nextButton.setTitle("Next", for: UIControlState.normal)
            UIView.commitAnimations()
            side = 0
        }
    }
}
