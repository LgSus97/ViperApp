//
//  Session.swift
//  ViperApp
//
//  Created by Jesus Loaiza Herrera on 14/09/23.
//

import Foundation

protocol Session {
  func setUser(user: User) async -> Bool
  func getUser() async -> User?
}
