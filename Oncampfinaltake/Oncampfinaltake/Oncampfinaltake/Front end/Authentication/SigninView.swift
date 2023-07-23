//
//  SigninView.swift
//  Oncampfinaltake
//
//  Created by Elijah Smith on 7/20/23.
//

import SwiftUI
import FirebaseAuth
struct SigninView: View {
    @State private var email: String = ""
       @State private var password: String = ""
       @State private var showAlert = false
       @State private var alertMessage = ""
       @State private var loginSuccessful = false
       
       var body: some View {
           VStack {
               Spacer()
               
               Text("Sign in")
                   .font(.largeTitle)
                   .fontWeight(.bold)
               
               Image("logo") // Replace with your app logo image
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 150, height: 150)
                   .padding(.bottom, 40)
               
               VStack(spacing: 20) {
                   TextField("Email", text: $email)
                       .padding()
                       .background(Color.gray.opacity(0.1))
                       .cornerRadius(10)
                   
                   SecureField("Password", text: $password)
                       .padding()
                       .background(Color.gray.opacity(0.1))
                       .cornerRadius(10)
               }
               .padding(.horizontal, 30)
               
               Button(action: login) {
                   Text("Log In")
                       .foregroundColor(.white)
                       .font(.headline)
                       .padding()
                       .frame(maxWidth: .infinity)
                       .background(Color.blue)
                       .cornerRadius(10)
                       .padding(.horizontal, 30)
               }
               
               Spacer()
               
              
           }
           .padding()
           .background(Color.white)
           .edgesIgnoringSafeArea(.all)
           .alert(isPresented: $showAlert) {
               Alert(title: Text("Login Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
           }
       }
    func login() {
           Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
               if let error = error {
                   // Handle login error
                   self.alertMessage = error.localizedDescription
                   self.showAlert = true
               } else {
                   // Login successful, proceed to MainView
                   self.loginSuccessful = true
                   
               }
           }
       }

   }


struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
