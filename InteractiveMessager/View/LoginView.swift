//
//  ContentView.swift
//  InteractiveMessager
//
//  Created by kaito on 2024/01/15.
//

import SwiftUI

struct LoginView: View {
    //ScreenTransition
    @State private var Showshould_SignupView = false
    
    //Login
    @State private var EmailTextfield: String = ""
    @State private var PasswordTextfield: String = ""

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
                        TextField("Email✉️", text: $EmailTextfield).frame(width: 280, height: 50).background(Color.white).cornerRadius(5)
                        TextField("Password🔑", text: $PasswordTextfield).frame(width: 280, height: 50).background(Color.white).cornerRadius(5)
                        Spacer()
                        Button(action: {
                            
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
            .navigationDestination(isPresented: $Showshould_SignupView){
                SignupView()
            }
        }
    }
}

#Preview {
    LoginView()
}
