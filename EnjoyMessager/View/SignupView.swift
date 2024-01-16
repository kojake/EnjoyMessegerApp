//
//  SignupView.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/15.
//

import SwiftUI
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

struct SignupView: View {
    //ScreenTransition
    @Environment(\.dismiss) var dismiss
    @State private var Showshould_ContentView = false
    
    //Signup
    @State private var NewUsername: String = ""
    @State private var NewEnjoyMessagerID: String = ""
    @State private var NewEmailTextfield: String = ""
    @State private var NewPasswordTextfield: String = ""
    
    //ErroAlert
    @State private var ErrorAlert = false
    @State var Errormessage: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("🖐️").font(.system(size: 50))
                Text("Hello World").font(.system(size: 30)).fontWeight(.black).padding()
                Text("👀").font(.system(size: 50))
            }.padding()
            Spacer()
            ZStack{
                Image(systemName: "pencil").resizable().scaledToFit().frame(width: 200, height: 200).foregroundColor(Color.mint)
                VStack{
                    Text("Sign up").font(.largeTitle).fontWeight(.black).foregroundColor(Color.white).padding()
                    Spacer()
                    TextField("New Username", text: $NewUsername).frame(width: 280, height: 50).background(Color.white).cornerRadius(5)
                    TextField("New EnjoyMessagerID", text: $NewEnjoyMessagerID).frame(width: 280, height: 50).background(Color.white).cornerRadius(5)
                    TextField("New Email✉️", text: $NewEmailTextfield).frame(width: 280, height: 50).background(Color.white).cornerRadius(5).keyboardType(.emailAddress)
                    TextField("New Password🔑", text: $NewPasswordTextfield).frame(width: 280, height: 50).background(Color.white).cornerRadius(5)
                    Spacer()
                    Button(action: {
                        SignUp()
                    }){
                        HStack{
                            Text("Signup").font(.title).fontWeight(.black)
                            Image(systemName: "pencil").resizable().scaledToFit().frame(width: 30, height: 30)
                        }.frame(width: 250, height: 50).background(Color.pink.opacity(0.5)).foregroundColor(Color.white).cornerRadius(20)
                    }.padding()
                    Button(action: {
                        dismiss()
                    }){
                        Text("Do you have an account?😀").foregroundColor(Color.blue)
                    }.padding()
                }.frame(width: 300, height: 450).background(Color.black.opacity(0.5)).cornerRadius(10)
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
        .alert(isPresented: $ErrorAlert){
            Alert(title: Text("😞 Error 😭")
                  ,message: Text(Errormessage)
                  ,dismissButton: .default(Text("Ok")
            ))
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $Showshould_ContentView){
            ContentView()
        }
    }
    func SignUp() {
        Auth.auth().createUser(withEmail: NewEmailTextfield, password: NewPasswordTextfield) { (result, error) in
            if let error = error {
                // エラーがある場合、エラーメッセージをセットしてアラートを表示
                Errormessage = error.localizedDescription
                ErrorAlert = true
            } else {
                if NewUsername == ""{
                    Errormessage = "ユーザーネームを入力してください"
                    ErrorAlert = true
                } else if NewEnjoyMessagerID == ""{
                    Errormessage = "インタラクティブメッセンジャーIDを入力してください"
                    ErrorAlert = true
                } else if NewEmailTextfield == ""{
                    Errormessage = "Emailを入力してください"
                    ErrorAlert = true
                } else if NewPasswordTextfield == ""{
                    Errormessage = "パスワードを入力してください"
                    ErrorAlert = true
                } else {
                    AccountCreate(NewUsername: NewUsername, NewEnjoyMessagerID: NewEnjoyMessagerID, NewEmailTextfield: NewEmailTextfield, NewPasswordTextfield: NewPasswordTextfield)
                    Showshould_ContentView = true
                }
            }
        }
    }
}

#Preview {
    SignupView()
}
