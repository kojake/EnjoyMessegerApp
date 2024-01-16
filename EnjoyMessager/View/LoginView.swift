//
//  ContentView.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/15.
//

import SwiftUI
import UIKit
import FirebaseFirestoreInternal
import FirebaseCore
import FirebaseAuth

struct LoginView: View {
    //ScreenTransition
    @State private var Showshould_SignupView = false
    @State private var Showshould_ConetntView = false
    
    //Login
    @State private var Email: String = ""
    @State private var Password: String = ""

    //ErroAlert
    @State private var ErrorAlert = false
    @State var Errormessage: String = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Text("🙌").font(.system(size: 50)).fontWeight(.black)
                    Text("I've been \nwaiting for you!").font(.system(size: 25)).fontWeight(.black).padding()
                    Text("🙌").font(.system(size: 50)).fontWeight(.black)
                }.padding()
                Spacer()
                ZStack{
                    Image(systemName: "lock.fill").resizable().scaledToFit().frame(width: 200, height: 200).foregroundColor(Color.yellow)
                    VStack{
                        Text("Login").font(.largeTitle).fontWeight(.black).foregroundColor(Color.white).padding()
                        Spacer()
                        TextField("Email✉️", text: $Email).frame(width: 280, height: 50).background(Color.white).cornerRadius(5).keyboardType(.emailAddress)
                        TextField("Password🔑", text: $Password).frame(width: 280, height: 50).background(Color.white).cornerRadius(5)
                        Spacer()
                        Button(action: {
                            Login()
                        }){
                            HStack{
                                Text("Login").font(.title).fontWeight(.black)
                                Image(systemName: "lock.open").resizable().scaledToFit().frame(width: 40, height: 40)
                            }.frame(width: 250, height: 50).background(Color.pink.opacity(0.5)).foregroundColor(Color.white).cornerRadius(20)
                        }
                        Button(action: {
                            Showshould_SignupView = true
                        }){
                            Text("Don't have an account?🫣").foregroundColor(Color.blue)
                        }.padding()
                    }.frame(width: 300, height: 400).background(Color.black.opacity(0.5)).cornerRadius(10)
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("閉じる") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
            .navigationDestination(isPresented: $Showshould_SignupView){
                SignupView()
            }
            .navigationDestination(isPresented: $Showshould_ConetntView){
                ContentView(Email: $Email)
            }
        }
        .alert(isPresented: $ErrorAlert){
            Alert(title: Text("😞 Error 😭")
                  ,message: Text(Errormessage)
                  ,dismissButton: .default(Text("Ok")
            ))
        }
    }
    func Login() {
        // Firebaseログインの処理
        Auth.auth().signIn(withEmail: Email, password: Password) { result, error in
            if let error = error {
                Errormessage = error.localizedDescription
                ErrorAlert = true
            } else {
                Showshould_ConetntView = true
            }
        }
    }
}

#Preview {
    LoginView()
}
