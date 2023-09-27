//
//  UsersInteractor.swift
//  ViperApp
//
//  Created by Jesus Loaiza Herrera on 14/09/23.
//

import Foundation
import UIKit

struct UserInteractor {
  var fetchUsers: () async -> [User]
  var callUser: (User) -> ()
  
  static func interactor() -> UserInteractor {
    return UserInteractor {
      try? await Task.sleep(until: .now + .seconds(2), clock: .continuous)
      return [User(user: "user1", userID: UUID(), phone: "5543159840")]
    } callUser: { user in
      guard let url = URL(string: "phone: \(user.phone)") else { return }
      UIApplication.shared.open(url)
    }
  }
  
}
