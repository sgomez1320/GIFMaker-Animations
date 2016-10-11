//
//  ViewController.swift
//  Animations
//
//  Created by Sergio Gomez on 10/7/16.
//  Copyright © 2016 Sergio Gomez. All rights reserved.
//

/*************************************************************************************************************************************************************
 This program runs simple animations on cartoon images as well as has the option of making a gif from the images. 
 *************************************************************************************************************************************************************/

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var nextStopOutlet: UIButton!
    var imageCenter = CGPoint(x: 0, y: 0)
    
    var counter = 1
    var isAnimating = false
    var timer = Timer()
    
    func animate(){
        image.image = UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        counter+=1
        
        if counter == 6 {
            counter = 0
        }
    }
    
    @IBAction func next(_ sender: AnyObject) {

        if isAnimating {
            isAnimating = false
            timer.invalidate()
            nextStopOutlet.setTitle("Start Animation", for: []) // "for: .normal" also works
        } else {
            isAnimating = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            nextStopOutlet.setTitle("Stop Animation", for: [])
        }
        
    }
    
    @IBAction func fadeIn(_ sender: AnyObject) {
        image.alpha = 0 //will make image invisible
        
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    
    @IBAction func slideIn(_ sender: AnyObject) {
        //image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        image.center = CGPoint(x: imageCenter.x-500, y: imageCenter.y)
        UIView.animate(withDuration: 2, animations: {
            //need self because inside of a closure
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y) //add 500 because above is 500 to the left. now add 500 to get image back to where it was originally
        })
    }
    @IBAction func grow(_ sender: AnyObject) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1){
            self.image.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        }
        image.center = CGPoint(x: imageCenter.x, y: imageCenter.y)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageCenter.x = self.image.center.x
        imageCenter.y = self.image.center.y
        print(imageCenter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

