//
//  ViewController.swift
//  member db
//
//  Created by tjoeun-304 on 03/09/2019.
//  Copyright © 2019 tjoeun-304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sql_member_table = """
        create table if not exists member (
            id text primary key,
            password text not null,
            name text,
            age integer,
            tel text,
            address text
        )
"""
    
    @IBOutlet var tf_id: UITextField!
    @IBOutlet var tf_password: UITextField!
    @IBOutlet var tf_name: UITextField!
    @IBOutlet var tf_age: UITextField!
    @IBOutlet var tf_tel: UITextField!
    @IBOutlet var tf_address: UITextField!
    @IBOutlet var lb_status: UILabel!
    
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
            // 파일 데이터베이스 연결 객체
            let memberDB = FMDatabase(path: self.databasePath)
            // 파일 데이터베이스 객체를 사용하여 데이터베이스에 접속한 후,
            // 테이블을 생성
            if memberDB.open() {
                if !memberDB.executeStatements(sql_member_table){
                    print("Create ERROR : \(memberDB.lastErrorMessage())")
                } else {
                    print("SUCCESS To Create Member Table")
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
                select * from member
                where id = '\(tf_id.text!)'
            """
            
            let result = db.executeQuery(sql, withArgumentsIn: [])
            if result?.next() == true {
                lb_status.text = "Found Member"
                tf_id.text = result?.string(forColumn: "id")
                tf_password.text = result?.string(forColumn: "password")
                tf_name.text = result?.string(forColumn: "name")
                tf_age.text = result?.string(forColumn: "age")
                tf_tel.text = result?.string(forColumn: "tel")
                tf_address.text = result?.string(forColumn: "address")
            } else {
                lb_status.text = "Failed searching member"
            }
            
           
        } else {
            print("Open Error : \(db.lastErrorMessage())")
        }
        
        db.close()
    }
    
    @IBAction func onClickSave(_ sender: UIButton) {
        let db = FMDatabase(path: self.databasePath)
        if db.open() {
            let sql = """
                insert into member values (
                '\(tf_id.text!)','\(tf_password.text!)','\(tf_name.text!)',
                \(tf_age.text!), '\(tf_tel.text!)','\(tf_address.text!)')
            """
            if db.executeUpdate(sql, withArgumentsIn:[]) {
                lb_status.text = "Member Added"
                tf_id.text = ""; tf_password.text = ""; tf_name.text = "";
                tf_age.text = ""; tf_tel.text = ""; tf_address.text = "";
            } else {
                lb_status.text = "Failed to insert member"
                print("Insert Error: \(db.lastErrorMessage())")
            }
        } else {
            print("Open Error : \(db.lastErrorMessage())")
        }
        
        db.close()
    }
    
}

