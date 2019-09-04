//
//  ViewController.swift
//  ImageViewer
//
//  Created by tjoeun304 on 30/08/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //let imageFileNames = ["1.jpg", "2.jpg", "3.jpg"]
    let imageFileNames = ["https://i.ytimg.com/vi/4Tvtj-nRNzk/maxresdefault.jpg",
                    "https://i.pinimg.com/originals/45/97/9f/45979fae790390a74d6f195c73ff994a.png",
    "https://images.mypetlife.co.kr/content/uploads/2019/05/05202839/adorable-animal-animal-photography-225406-1024x681.jpg",
    "https://post-phinf.pstatic.net/MjAxNzEwMTFfMTAw/MDAxNTA3NzEzMjYxMTY4.sDc3t5OT2SDQBwsceApvOoDqbpRK74dOsz1NVjCfzxgg.xaGc41l2hMcSwUn0PT_0CleINl7EKlSf2_e_p6MqDvEg.JPEG/%EB%8B%A4%EB%9E%8C%EC%A5%90_%285%29.jpg?type=w1200"]
    var images: Array<UIImage>?

    var curIndex = 0
    
    @IBOutlet var imageViewer: UIImageView!
    
    @IBOutlet var btnBefore: UIButton!
    @IBOutlet var btnAfter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        images = Array()
        for image_name in imageFileNames {
            /*
            let image = UIImage(named: image_name)
            images?.append(image!)
            */
            let url = URL(string: image_name)
            do {
                let data = try Data(contentsOf: url!)
                let image = UIImage(data: data)
                images?.append(image!)
            } catch {
                
            }
        }
    }

    @IBAction func onClickBefore(_ sender: UIButton) {
        curIndex -= 1
        
        if curIndex < 0 {
            curIndex = 0
            self.btnBefore.isEnabled = false
            return
        } else if curIndex == 0 {
            self.btnBefore.isEnabled = false
        }
        
        self.imageViewer.image = images?[curIndex]
        
        if !self.btnAfter.isEnabled {
            self.btnAfter.isEnabled = true
        }
    }
    
    @IBAction func onClickAfter(_ sender: UIButton) {
        curIndex += 1
        
        if curIndex >= self.images!.count {
            curIndex = self.images!.count - 1
            self.btnAfter.isEnabled = false
            return
        } else if curIndex == self.images!.count - 1 {
            self.btnAfter.isEnabled = false
        }
        
        self.imageViewer.image = images?[curIndex]
        
        if !self.btnBefore.isEnabled {
            self.btnBefore.isEnabled = true
        }
    }
}

