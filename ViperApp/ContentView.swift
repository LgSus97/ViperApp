//
//  ContentView.swift
//  ViperApp
//
//  Created by Jesus Loaiza Herrera on 07/09/23.
//

import SwiftUI

struct ContentView: View {
  @State var mail: String = ""
  @State var password: String = ""
  
  var body: some View {
    VStack {
      Text("BNS")
        .foregroundColor(Color.white)
        .font(.system(size: 50))
        .padding(.top, 50)
      CredentialsView(placeholderMail: "Email",
                      placeholderPass: "Password",
                      mailInput: $mail,
                      passInput: $password)
        .padding(30)
      AccessView()
      Spacer()
    }
    .background(LinearGradient(colors: [Color(red:19/255, green: 60/255, blue: 100/255),
                                        Color(red:25/255, green: 75/255, blue: 115/255),
                                        Color(red:33/255, green: 90/255, blue: 150/255),
                                        Color(red:45/255, green: 105/255, blue: 175/255),
                                        Color(red:60/255, green: 115/255, blue: 189/255),
                                        Color(red:70/255, green: 120/255, blue: 190/255),
                                       ],
                               startPoint: .top,
                               endPoint: .bottom))
    .frame(maxHeight: .infinity)
  }
}



struct AccessView: View {
  
  var body: some View {
    VStack(spacing: 20){
      CustomButton(textButton: "SIGN IN", actionButton: {
        print("action SIGN IN")
      })
      HStack(alignment: .center) {
        VStack{
          Divider()
            .overlay(.white)
            .padding(.horizontal)
        }
        Text("or")
          .foregroundColor(.white)
        VStack{
          Divider()
            .overlay(.white)
            .padding(.horizontal)
        }
      }
      CustomButton(textButton: "FACEBOOK CONNECT", actionButton: {
        print("action FACEBOOK CONNECT")
      })
    }
  }

}


struct CustomButton: View {
  var textButton: String
  var actionButton: () -> Void
  
  var body: some View {
    Button(action: actionButton) {
      Text(textButton)
        .font(.system(size: 20,weight: .regular))
        .foregroundColor(.white)
    }
    .frame(height: 50)
    .frame(width: 350)
    .border(.white, width: 1)
  }
}

struct CredentialsView: View {
  var placeholderMail: String
  var placeholderPass: String
  
  @Binding var mailInput: String
  @Binding var passInput: String
  
  var body: some View {
    VStack{
      HStack{
        Image(systemName: "envelope.fill")
          .frame(width: 44,
                 height: 44)
        TextField("Correo",
                  text: $mailInput,
                  prompt: Text(placeholderMail)
          .font(.system(size: 20))
          .foregroundColor(.white))
      }
      Divider()
        .frame(height: 0.5)
        .background(Color.gray.opacity(0.8))
      HStack{
        Image(systemName: "lock.fill")
          .frame(width: 44,
                 height: 44)
        SecureField(placeholderPass,
                    text: $passInput,
                    prompt: Text(placeholderPass)
          .font(.system(size: 20))
          .foregroundColor(.white))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
