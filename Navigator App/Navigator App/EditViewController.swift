//
//  EditViewController.swift
//  Navigator App
//
//  Created by tjoeun304 on 02/09/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    var id: String?
    var name: String?
    var age: Int?
    
    var setInfoProtocol: EditProtocol?
    
    @IBOutlet var tfId: UITextField!
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfId.text = self.id
        tfName.text = self.name
        tfAge.text = "\(self.age)"
    }
    
    @IBAction func onClickDone(_ sender: UIButton) {
        self.setInfoProtocol?.setUserInfomation(id: tfId.text!, name: tfName.text!, age: Int(tfAge.text!)!)
        
        // 세그웨이에 의해서 이동된 페이지를 원래의 페이지로 이동시키는 코드
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
