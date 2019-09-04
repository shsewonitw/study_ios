//
//  DetailViewController.swift
//  swipe app
//
//  Created by tjoeun-304 on 03/09/2019.
//  Copyright © 2019 tjoeun-304. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var DetailImageView: UIImageView!
    
    var targetImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DetailImageView.image = self.targetImage!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onTapAction(_ sender: UITapGestureRecognizer) {
    
        let newImageView = UIImageView(image: targetImage)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFill
        newImageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(deleteFullImage))
        
        newImageView.addGestureRecognizer(tap)
        
        UIView.transition(with: self.view, duration: 1.0, options: .transitionCurlUp, animations: {
            self.view.addSubview(newImageView);
            self.navigationController?.isNavigationBarHidden=true;
            self.tabBarController?.tabBar.isHidden=true
        }, completion: nil)
        
    }
    
    @objc func deleteFullImage(_ sender: UITapGestureRecognizer) {
        UIView.transition(with: self.view, duration: 1.0, options: .transitionCurlDown, animations: {
            sender.view?.removeFromSuperview();
            self.navigationController?.isNavigationBarHidden=false;
            self.tabBarController?.tabBar.isHidden=false
        }, completion: nil)
    }
    
}
