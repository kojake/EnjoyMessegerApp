//
//  MessegeView.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/15.
//

import SwiftUI
import FirebaseFirestore

struct MessageView: View {
//    @Binding var Roomname: String
//    @Binding var Username: String
    
    //ScreenTransition
    @Environment(\.dismiss) var dismiss
    
    //Room
    @State var SendingMessageTextfield: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    dismiss()
                }){
                    Image(systemName: "arrow.left").frame(width: 60, height: 60).background(Color.mint).foregroundColor(Color.white).cornerRadius(50)
                }.padding()
                Spacer()
            }
            List{
                
            }
            Spacer()
            HStack{
                TextField("Aa", text: $SendingMessageTextfield)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(8)
                Button(action: {

                }){
                    Image(systemName: "paperplane.fill").frame(width: 40, height: 40).background(Color.blue).foregroundColor(Color.white).cornerRadius(50)
                }
            }.frame(maxWidth: .infinity, maxHeight: 60).background(Color.purple.opacity(0.2))
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("閉じる") {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            var TransmissionConfirmationTimer: Timer? = nil
            TransmissionConfirmationTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                RoomFriendmessageGet()
            }
        }
    }
    func RoomFriendmessageGet() {

    }
}

#Preview {
    MessageView()
}
