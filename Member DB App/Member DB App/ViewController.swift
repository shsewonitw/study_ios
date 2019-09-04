//
//  ViewController.swift
//  Member DB App
//
//  Created by tjoeun304 on 03/09/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let sql_member_table = """
        create table if not exists member (
            id text primary key,
            password text not null,
            name text,
            age integer,
            phone text,
            address text
        )
"""
    
    @IBOutlet var tfId: UITextField!
    @IBOutlet var tfPassword: UITextField!
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfAge: UITextField!
    @IBOutlet var tfPhone: UITextField!
    @IBOutlet var tfAddress: UITextField!
    @IBOutlet var lbStatus: UILabel!
    
    var databasePath: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 데이터베이스 파일을 저장하기 위한 경로를 추출하는 내용
        let fileMgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0] as String
        
        // 데이터베이스 파일명 변수 설정
        self.databasePath = docsDir.appending("/member.db")
        
        // 데이터베이스 파일이 존재하지 않으면 데이터베이스 파일 생성
        if !fileMgr.fileExists(atPath: self.databasePath!) {
            // 파일 데이터베이스의 연결 객체
            let memberDB = FMDatabase(path: self.databasePath)
            // 파일 데이터베이스 객체를 사용하여 데이터베이스에 접속한 후,
            // 테이블을 생성
            if memberDB.open() {
                if !memberDB.executeStatements(sql_member_table) {
                    print("Create ERROR : \(memberDB.lastErrorMessage())")
                } else {
                    print("SUCCESS To Create Member Table.")
                }
               
                // 데이터베이스 내부에 테이블을 생성한 후,
                // 연결 객체를 종료
                memberDB.close()
            } else {
                print("Open ERROR : \(memberDB.lastErrorMessage())")
            }
            
        }
        
    }

    @IBAction func onClickSearch(_ sender: UIButton) {
        
        let db = FMDatabase(path: self.databasePath)
        
        if db.open() {
            let sql = """
                select *
                from member
                where id = '\(tfId.text!)'
            """
            
            let result = db.executeQuery(sql, withArgumentsIn: [])
            
            if result?.next() == true {
                lbStatus.text = "Found Member"
                tfId.text = result?.string(forColumn: "id")
                tfPassword.text = result?.string(forColumn: "password")
                tfName.text = result?.string(forColumn: "name")
                tfAge.text = result?.string(forColumn: "age")
                tfPhone.text = result?.string(forColumn: "phone")
                tfAddress.text = result?.string(forColumn: "address")
            } else {
                lbStatus.text = "Failed searching member"
            }
            
            result?.close()
        } else {
            print("Open Error : \(db.lastErrorMessage())")
        }
        
        db.close()
    }
    
    @IBAction func onClickInsert(_ sender: UIButton) {
        
        let db = FMDatabase(path: self.databasePath)
        
        if db.open() {
            let sql = """
                insert into member
                values ('\(tfId.text!)', '\(tfPassword.text!)',
                '\(tfName.text!)', \(tfAge.text!),
                '\(tfPhone.text!)', '\(tfAddress.text!)')
            """
            if db.executeUpdate(sql, withArgumentsIn: []) {
                lbStatus.text = "Member Added"
                tfId.text = ""; tfPassword.text = ""
                tfName.text = ""; tfAge.text = ""
                tfPhone.text = ""; tfAddress.text = ""
            } else {
                lbStatus.text = "Failed to insert member"
                print("Insert Error : \(db.lastErrorMessage())")
            }
        } else {
            print("Open Error : \(db.lastErrorMessage())")
        }
        
        db.close()
    }
}

