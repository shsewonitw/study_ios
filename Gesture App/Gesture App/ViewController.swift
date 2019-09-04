//
//  ViewController.swift
//  Gesture App
//
//  Created by tjoeun304 on 03/09/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedIndex = 0
    let imageNames = ["1.jpg", "2.jpg", "3.jpg"]
    var images: Array<UIImage?> = []

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btnBefore: UIButton!
    @IBOutlet var btnAfter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnBefore.isEnabled = false
        
        for index in 0 ... imageNames.count - 1 {
            images.append(UIImage(named: imageNames[index]))
        }
        
        self.imageView.image = images[selectedIndex]
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
    
    func moveToBefore() {
        if selectedIndex == 0 {
            return
        }
        
        selectedIndex -= 1
        self.imageView.image = images[selectedIndex]
        
        if selectedIndex == 0 {
            btnBefore.isEnabled = false
        }
        
        if selectedIndex != images.count - 1 && !btnAfter.isEnabled {
            btnAfter.isEnabled = true
        }
    }
    
    func moveToAfter() {
        if selectedIndex == images.count - 1 {
            return
        }
        
        selectedIndex += 1
        self.imageView.image = images[selectedIndex]
        
        if selectedIndex == images.count - 1 {
            btnAfter.isEnabled = false
        }
        
        if selectedIndex != 0 && !btnBefore.isEnabled {
            btnBefore.isEnabled = true
        }
    }

    @IBAction func onTabAction(_ sender: UITapGestureRecognizer) {
        
        print(sender.numberOfTapsRequired)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let target: DetailViewController = segue.destination as! DetailViewController
        target.image = self.images[selectedIndex]
    }
}

