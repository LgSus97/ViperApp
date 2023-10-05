//
//  LoginRequestSession.swift
//  ViperApp
//
//  Created by Jesus Loaiza Herrera on 28/09/23.
//

import Foundation


import Foundation

class LoginRequestSession {
    
    func sendPostRequest(username: String, password: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
      
      let requestSession = RequestSession()

      
      let headers = [
            "content-type": "application/json",
            "Authentication": "<REQUIRED>",
            "X-RapidAPI-Key": "SIGN-UP-FOR-KEY",
            "X-RapidAPI-Host": "logintesting.p.rapidapi.com"
        ]
        
        let parameters = [
            "username": username,
            "password": password
        ]
        
        

   
    }
}


