//
//  DetailViewController.swift
//  Gesture App
//
//  Created by tjoeun304 on 03/09/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var image: UIImage?
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageView.image = self.image
    }
    @IBAction func onTabAction(_ sender: UITapGestureRecognizer) {
        
        let newImageView = UIImageView(image: image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(deleteFullImage))
        newImageView.addGestureRecognizer(tap)
        
        UIView.transition(with: self.view, duration: 1.0, options: .transitionCurlUp, animations: {self.view.addSubview(newImageView);self.navigationController?.isNavigationBarHidden=true;self.tabBarController?.tabBar.isHidden=true}, completion: nil)
    }
    
    @objc func deleteFullImage(_ sender: UITapGestureRecognizer) {
        UIView.transition(with: self.view, duration: 1.0, options: .transitionCurlDown, animations: {sender.view?.removeFromSuperview();self.navigationController?.isNavigationBarHidden=false;self.tabBarController?.tabBar.isHidden=false}, completion: nil)
    }
}
