//
//  ViewController.swift
//  DatePicker
//
//  Created by tjoeun-304 on 30/08/2019.
//  Copyright © 2019 tjoeun-304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var limit = false
    var limit_time:Int = 60
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self,
                             selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        
        if limit {
            limit_time -= 1
        }
        
        if limit_time == 0 {
            limit = false
            limit_time = 60
        }
        
//        lblCurrentTime.text = String(count)
//        count += 1
        
        let date = NSDate()
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        var alarmTime = formatter.string(from: datePicker.date)
        var currentTime = formatter.string(from: date as Date)
        if( (alarmTime == currentTime) && (limit == false) ) {
            let alarmAlert = UIAlertController(title: "알림", message: "설정된 시간대 입니다 !!!", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            alarmAlert.addAction(onAction)
            present(alarmAlert, animated: true, completion:nil)
            
            limit = true
        }
        
    }
}

