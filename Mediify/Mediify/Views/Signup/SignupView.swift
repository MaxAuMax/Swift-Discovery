//
//  SigninView.swift
//  Mediify
//
//  Created by MaxAuMax on 30/04/2023.
//

import SwiftUI

private enum FocusedField: Hashable {
    case phone
    case email
    case password
    case confirm
}

struct SignupView: View {
    @Environment(\.presentationMode) private var presentation
    
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        VStack {
            HStack() {
                VStack(alignment: .leading) {
                    Text("Let's sign up.")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom, 1)
                    Text("Welcome")
                        .font(.title2)
                    Text("new member!")
                        .font(.title2)
                }
                .fixedSize()
                .padding(.trailing, 20)
                
                Image("Capsule Ouverte")
                    .resizable()
                    .frame(width: 140, height: 140)
            }
            
            Spacer()
            
            Group {
                TextField("Phone Number", text: $phoneNumber, prompt: Text("Phone number"))
                    .textFieldStyle(OutlinedTextFieldStyle())
                    .focused($focusedField, equals: .phone)
                
                TextField("Email", text: $email, prompt: Text("Email"))
                    .textFieldStyle(OutlinedTextFieldStyle())
                    .focused($focusedField, equals: .email)
                
                SecureField("Password", text: $password, prompt: Text("Password"))
                    .textFieldStyle(OutlinedTextFieldStyle(image: Image(systemName: "lock")))
                    .focused($focusedField, equals: .password)
                
                SecureField("Confirm Password", text: $confirmPassword, prompt: Text("Confrm password"))
                    .textFieldStyle(OutlinedTextFieldStyle(image: Image(systemName: "lock")))
                    .focused($focusedField, equals: .confirm)
            }
            .onSubmit {
                switch (focusedField) {
                    case .phone:
                        focusedField = .email
                    case .email:
                        focusedField = .password
                    case .password:
                        focusedField = .confirm
                    default:
                        focusedField = nil
                }
            }
            
            HStack {
                Text("Have an account?")
                Button {
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Text("Log in")
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .padding(.top)
            
            NavigationLink {
                Text("New view")
            } label: {
                Text("Next")
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .background(Color("lightPurple"))
            .foregroundColor(.white)
            .cornerRadius(25)
            .font(.system(size: 22))
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal)
    }
}

struct OutlinedTextFieldStyle: TextFieldStyle {
    var image: Image?
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            configuration
            if (image != nil) {
                image
            }
        }
        .padding(23)
        .overlay {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(Color(UIColor.systemGray4), lineWidth: 1)
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
