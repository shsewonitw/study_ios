//
//  ViewController.swift
//  Network Test App
//
//  Created by tjoeun304 on 04/09/2019.
//  Copyright © 2019 tjoeun304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickGet(_ sender: UIButton) {
        // http, https 프로토콜의 통신을 지원하는 객체 생성
        var defaultSession = URLSession(configuration: .default)
        // URLSession 객체를 통해 통신을 처리할 수 있는 TASK 변수 선언
        var dataTask: URLSessionDataTask?
        // URL 문자열을 기반으로 다양한 작업을 처리할 수 있는 객체 생성
        var urlComponents = URLComponents(string: "http://localhost:8080/ios/member")
        // URLComponents 객체에 쿼리 스트링을 지정하는 방법
        // (? 생략 후 키=밸류&키=밸류)
        // urlComponents?.query = "id=admin&name=AAA"
        
        // guard let : 특정 변수의 값이 유효한 지 체크하는 문법
        // 반드시 else 절을 정의하여 return 하는 구문이 포함되어야 합니다.
        guard let url = urlComponents?.url else { return }
        
        // URLSession 객체를 활용한 DataTask 객체 생성
        // 통신이 끝난 이후의 작업을 클로저로 정의합니다.
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let error = error {
                NSLog("통신 에러 발생")
                NSLog("에러 메세지 : " + error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                
                NSLog(String(data: data, encoding: .utf8)!)
                var member: Member = try! JSONDecoder().decode(Member.self, from: data)
                NSLog("member.id -> \(member.id), member.name -> \(member.name), member.age -> \(member.age)")
                
            }
        }
        
        // DataTask 객체는 일시 중시 상태로 생성되며
        // 반드시 resume 메소드를 호출해야만 실행됩니다.
        dataTask?.resume()
    }
    
    @IBAction func onClickPost(_ sender: UIButton) {
        // http, https 프로토콜의 통신을 지원하는 객체 생성
        var defaultSession = URLSession(configuration: .default)
        // URLSession 객체를 통해 통신을 처리할 수 있는 TASK 변수 선언
        var dataTask: URLSessionDataTask?
        // URL 문자열을 기반으로 다양한 작업을 처리할 수 있는 객체 생성
        var urlComponents = URLComponents(string: "http://localhost:8080/ios/member")
        // URLComponents 객체에 쿼리 스트링을 지정하는 방법
        // (? 생략 후 키=밸류&키=밸류)
        // urlComponents?.query = "id=admin&name=AAA"
        
        // guard let : 특정 변수의 값이 유효한 지 체크하는 문법
        // 반드시 else 절을 정의하여 return 하는 구문이 포함되어야 합니다.
        guard let url = urlComponents?.url else { return }
        
        // POST 방식의 요청을 처리하기 위한 URLRequest 객체 생성
        var request = URLRequest(url: url)
        // 요청 방식의 설정
        request.httpMethod = "POST"
        // 요청 데이터 설정
        let body = "id=tje&name=tje_admin&age=22".data(using: String.Encoding.utf8)
        request.httpBody = body
        
        // URLSession 객체를 활용한 DataTask 객체 생성
        // 통신이 끝난 이후의 작업을 클로저로 정의합니다.
        dataTask = defaultSession.dataTask(with: request) { data, response, error in
            if let error = error {
                NSLog("통신 에러 발생")
                NSLog("에러 메세지 : " + error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                
                NSLog(String(data: data, encoding: .utf8)!)
                var member: Member = try! JSONDecoder().decode(Member.self, from: data)
                NSLog("member.id -> \(member.id), member.name -> \(member.name), member.age -> \(member.age)")
                
            }
        }
        
        // DataTask 객체는 일시 중시 상태로 생성되며
        // 반드시 resume 메소드를 호출해야만 실행됩니다.
        dataTask?.resume()
    }
    
    @IBAction func onClickMultiResponse(_ sender: UIButton) {
        // http, https 프로토콜의 통신을 지원하는 객체 생성
        var defaultSession = URLSession(configuration: .default)
        // URLSession 객체를 통해 통신을 처리할 수 있는 TASK 변수 선언
        var dataTask: URLSessionDataTask?
        // URL 문자열을 기반으로 다양한 작업을 처리할 수 있는 객체 생성
        var urlComponents = URLComponents(string: "http://localhost:8080/ios/member/5")
        // URLComponents 객체에 쿼리 스트링을 지정하는 방법
        // (? 생략 후 키=밸류&키=밸류)
        // urlComponents?.query = "id=admin&name=AAA"
        
        // guard let : 특정 변수의 값이 유효한 지 체크하는 문법
        // 반드시 else 절을 정의하여 return 하는 구문이 포함되어야 합니다.
        guard let url = urlComponents?.url else { return }
        
        // URLSession 객체를 활용한 DataTask 객체 생성
        // 통신이 끝난 이후의 작업을 클로저로 정의합니다.
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let error = error {
                NSLog("통신 에러 발생")
                NSLog("에러 메세지 : " + error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                
                NSLog(String(data: data, encoding: .utf8)!)
                var members = try! JSONDecoder().decode(Array<Member>.self, from: data)
                
                NSLog("전달받은 멤버의 개수 -> \(members.count)")
                for member in members {
                    NSLog("member.id -> \(member.id), member.name -> \(member.name), member.age -> \(member.age)")
                }
                
                
                
            }
        }
        
        // DataTask 객체는 일시 중시 상태로 생성되며
        // 반드시 resume 메소드를 호출해야만 실행됩니다.
        dataTask?.resume()
    }
}

