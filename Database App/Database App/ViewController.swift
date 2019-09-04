//
//  ViewController.swift
//  Database App
//
//  Created by tjoeun304 on 03/09/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfAddress: UITextField!
    @IBOutlet var tfPhone: UITextField!
    @IBOutlet var lbStatus: UILabel!
    
    var databasesPath: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let fileMgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let docsDir = dirPaths[0] as String
        
        databasesPath = docsDir.appending("/contact.db")
        // 데이터베이스 파일이 존재하지 않으면 데이터베이스 파일 생성
        if !fileMgr.fileExists(atPath: databasesPath!) {
            let contactDB = FMDatabase(path: databasesPath)
            // 데이터베이스를 열고 contacts 테이블을 생성한다.
            if contactDB.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)"
                if !contactDB.executeStatements(sql_stmt) {
                    print("Error \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                print("Error \(contactDB.lastErrorMessage())")
            }
        }
    }
    @IBAction func onClickSave(_ sender: UIButton) {
        let contactDB = FMDatabase(path: databasesPath)
        
        if contactDB.open() {
            let insertSQL = "INSERT INTO CONTACTS (name, address, phone) VALUES ('\(tfName.text!)', '\(tfAddress.text!)', '\(tfPhone.text!)')"
            
            let result = contactDB.executeUpdate(insertSQL, withArgumentsIn: [])
            
            if !result {
                lbStatus.text = "Failed to add contact"
                print("Error \(contactDB.lastErrorMessage())")
            } else {
                lbStatus.text = "Contact Added"
                tfName.text = ""
                tfAddress.text = ""
                tfPhone.text = ""
            }
        } else {
            print("Error \(contactDB.lastErrorMessage())")
        }
    }
    
    @IBAction func onClickFind(_ sender: UIButton) {
        let contactDB = FMDatabase(path: databasesPath)
        
        if contactDB.open() {
            let querySQL = "SELECT address, phone FROM CONTACTS WHERE name = '\(tfName.text!)'"
            
            let result: FMResultSet? = contactDB.executeQuery(querySQL, withArgumentsIn: [])
            // next 메서드는 일치하는 레코드가 적어도 하나 이상인지 확인하기 위함
            if result?.next() == true {
                tfAddress.text = result?.string(forColumn: "address")
                tfPhone.text = result?.string(forColumn: "phone")
                lbStatus.text = "Record Found"
            } else {
                lbStatus.text = "Record not found"
                tfAddress.text = ""
                tfPhone.text = ""
            }
            contactDB.close()
        } else {
            print("Error \(contactDB.lastErrorMessage())")
        }
    }
}

