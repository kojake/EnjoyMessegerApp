//
//  ContentView.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/15.
//

import SwiftUI

struct ContentView: View {
    //ScreenTransition
    @State private var Showshould_AddFriendView = false
    
    @State var HelloWord: String = ""
    
    @State var FriendList: [String] = ["a","b","c"]
    
    var body: some View {
        VStack{
            HStack{
                Text(HelloWord).font(.title2).fontWeight(.black).padding()
                Spacer()
            }
            ScrollView{
                ForEach(0..<FriendList.count, id: \.self) { index in
                    HStack{
                        Text(FriendList[index]).font(.title2).fontWeight(.black).padding()
                        Spacer()
                        Button(action: {
                            
                        }){
                            Image(systemName: "message").frame(width: 50, height: 50).background(Color.white).foregroundColor(Color.black).cornerRadius(50)
                        }.padding()
                    }.frame(width: 330, height: 70).background(Color.pink.opacity(0.6)).cornerRadius(10)
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    Showshould_AddFriendView = true
                }){
                    Image(systemName: "plus").frame(width: 60, height: 60).background(Color.black).foregroundColor(Color.white).cornerRadius(50)
                }.padding()
            }
            Spacer()
        }
        .sheet(isPresented: $Showshould_AddFriendView){
            AddFriendView()
        }
        .onAppear{
            HelloWordDecision()
        }
        .navigationBarBackButtonHidden(true)
    }
    func HelloWordDecision() {
        let HelloWordList: [String] = ["若者ってなんで選挙\nでないんだ？", "I Love You❤️", "蛙化現象まじで理解できない", "Hello World", "YEAH-------!!!"]
        HelloWord = HelloWordList.randomElement()!
    }
}

#Preview {
    ContentView()
}
