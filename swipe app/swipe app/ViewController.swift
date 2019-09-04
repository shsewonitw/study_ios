//
//  ViewController.swift
//  swipe app
//
//  Created by tjoeun-304 on 03/09/2019.
//  Copyright © 2019 tjoeun-304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btnBefore: UIButton!
    @IBOutlet var btnAfter: UIButton!
    
    var images = ["1.jpeg","2.jpeg","3.jpg","4.jpeg","5.jpeg"]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: images[currentIndex])
        btnBefore.isEnabled = false
    }

    @IBAction func onClickBefore(_ sender: UIButton) {
        moveToBefore()
    }
    
    @IBAction func onClickAfter(_ sender: UIButton) {
        moveToAfter()
    }
    @IBAction func onSwipeActions(_ sender: UISwipeGestureRecognizer) {
        
        // print(sender.direction)
        
        if sender.direction == .left {
            moveToAfter()
        } else if sender.direction == .right {
            moveToBefore()
        }
        
    }
    
    func moveToBefore(){
        if currentIndex == 0 {
            return
        }
        btnAfter.isEnabled = true
        currentIndex -= 1
        imageView.image = UIImage(named: images[currentIndex])
        
        if currentIndex == 0 {
            btnBefore.isEnabled = false
            return
        }
    }
    
    func moveToAfter(){
        if currentIndex == images.count - 1 {
            return
        }
        
        btnBefore.isEnabled = true
        currentIndex += 1
        imageView.image = UIImage(named: images[currentIndex])
        if currentIndex == images.count - 1 {
            btnAfter.isEnabled = false
            return
        }
    }
    
    @IBAction func onTapAction(_ sender: UITapGestureRecognizer) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let target = segue.destination as! DetailViewController
        target.targetImage = UIImage(named: images[currentIndex])
    }
}

