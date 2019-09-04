//
//  ViewController.swift
//  Calculator App
//
//  Created by tjoeun304 on 02/09/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var tfFirstNumber: UITextField!
    @IBOutlet var tfSecondNumber: UITextField!
    
    @IBOutlet var btnPlus: UIButton!
    @IBOutlet var btnMinus: UIButton!
    @IBOutlet var btnMulti: UIButton!
    @IBOutlet var btnDivide: UIButton!
    
    var strBuho: String = ""
    
    @IBOutlet var swipeGestureRecognizer: UISwipeGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let target = segue.destination as! ResultViewController
        target.num1 = Double(self.tfFirstNumber.text!)!
        target.num2 = Double(self.tfSecondNumber.text!)!
        target.buho = self.strBuho
    }

    @IBAction func onClickPlus(_ sender: UIButton) {
        self.strBuho = "+"
        
    }
    @IBAction func onClickMinus(_ sender: UIButton) {
        self.strBuho = "-"
    }
    @IBAction func onClickMulti(_ sender: UIButton) {
        self.strBuho = "*"
    }
    @IBAction func onClickDivide(_ sender: UIButton) {
        self.strBuho = "/"
    }
    
    func setBtnState(sender: UIButton) {
        for btn in self.buttons {
            if btn == sender {
                btn.isSelected = true
            } else {
                btn.isSelected = false
            }
        }
    }
    
    @IBAction func tabAction(_ sender: UITapGestureRecognizer) {
        print(sender.numberOfTapsRequired)
        self.performSegue(withIdentifier: "segueByGesture", sender: self)
    }
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            self.performSegue(withIdentifier: "segueByGesture", sender: self)
        }
    }
    
    @IBAction func ttt(_ sender: UITapGestureRecognizer) {
        print("ttt")
            let imageView = UIImage(named: "1.jpg")
        let newImageView = UIImageView(image: imageView)
            newImageView.frame = UIScreen.main.bounds
            newImageView.backgroundColor = .black
            newImageView.contentMode = .scaleAspectFit
            newImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
            newImageView.addGestureRecognizer(tap)
        
        UIView.transition(with: self.view, duration: 2.0, options: .transitionFlipFromBottom, animations: {self.view.addSubview(newImageView)}, completion: nil)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
    }
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        
        
        //self.view.addSubview(newImageView)
        //self.navigationController?.isNavigationBarHidden = true
        //self.tabBarController?.tabBar.isHidden = true
        
        
        UIView.transition(with: self.view, duration: 2.0, options: .transitionFlipFromBottom, animations: {self.view.addSubview(newImageView); self.navigationController?.isNavigationBarHidden = true; self.tabBarController?.tabBar.isHidden = true}, completion: nil)
        
        
        
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        print("111")
        
        
        
        UIView.transition(with: self.view, duration: 0.5, options:.transitionCrossDissolve, animations: {sender.view?.removeFromSuperview();self.navigationController?.isNavigationBarHidden = false;self.tabBarController?.tabBar.isHidden = false}, completion: nil)
        
    }
}

