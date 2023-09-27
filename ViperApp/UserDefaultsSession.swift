//
//  UserDefaultsSession.swift
//  ViperApp
//
//  Created by Jesus Loaiza Herrera on 14/09/23.
//

import Foundation

class UserDefaultsSession: Session {
  
  func setUser(user: User) async -> Bool{
    UserDefaults.standard.save(customObject: user, inKey: "USER")
    return true
  }
  
  func getUser() async -> User? {
    return UserDefaults.standard.retrieve(object: User.self, fromKey: "USER")
  }
  
}
