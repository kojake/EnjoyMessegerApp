//
//  MessegeView.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/15.
//

import SwiftUI

struct MessegeView: View {
    //ScreenTransition
    @Environment(\.dismiss) var dismiss
    
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
            Spacer()
        }
    }
}

#Preview {
    MessegeView()
}
