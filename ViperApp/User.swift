//
//  User.swift
//  ViperApp
//
//  Created by Jesus Loaiza Herrera on 14/09/23.
//

import Foundation

struct User: Codable, Equatable{
  let user: String,
      userID: UUID,
      phone: String
}
