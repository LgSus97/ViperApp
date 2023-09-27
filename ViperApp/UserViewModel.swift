//
//  UserViewModel.swift
//  ViperApp
//
//  Created by Jesus Loaiza Herrera on 14/09/23.
//

import Foundation

class UserViewModel: ObservableObject {
  
  enum State: Equatable {
    case updated(Bool)
    case empty
    case user(User)
  }
  
  private let session: Session
  
  @Published private(set) var state: State
  
  init(state: State = .empty, userDefaultsSession: Session) {
    self.state = state
    self.session = userDefaultsSession
  }
  
  func saveUser(user: User)  {
    Task{ @MainActor in
      let response = await session.setUser(user: user)
      state = .updated(response)
    }
  }
  
  func getUser() {
    Task{ @MainActor in
      guard let user =  await session.getUser() else {
        return state = .empty
      }
      state = .user(user)
    }
  }
  
}
