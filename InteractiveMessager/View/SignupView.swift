//
//  SignupView.swift
//  InteractiveMessager
//
//  Created by kaito on 2024/01/15.
//

import SwiftUI

struct SignupView: View {
    //ScreenTransition
    @Environment(\.dismiss) var dismiss
    
    //Signup
    @State private var NewEmailTextfield: String = ""
    @State private var NewPasswordTextfield: String = ""
    
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
                    Text("Login").font(.largeTitle).fontWeight(.black).foregroundColor(Color.white).padding()
                    Spacer()
                    TextField("New Email✉️", text: $NewEmailTextfield).frame(width: 280, height: 50).background(Color.white).cornerRadius(5)
                    TextField("New Password🔑", text: $NewPasswordTextfield).frame(width: 280, height: 50).background(Color.white).cornerRadius(5)
                    Spacer()
                    Button(action: {
                        
                    }){
                        HStack{
                            Text("Signup").font(.title).fontWeight(.black)
                            Image(systemName: "pencil").resizable().scaledToFit().frame(width: 30, height: 30)
                        }.frame(width: 250, height: 50).background(Color.pink.opacity(0.5)).foregroundColor(Color.white).cornerRadius(20)
                    }
                    Button(action: {
                        dismiss()
                    }){
                        Text("Do you have an account?😀").foregroundColor(Color.blue)
                    }.padding()
                }.frame(width: 300, height: 400).background(Color.black.opacity(0.5)).cornerRadius(10)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignupView()
}
