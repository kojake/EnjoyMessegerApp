//
//  LoadingView.swift
//  EnjoyMessager
//
//  Created by kaito on 2024/01/16.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            ProgressView()
                .frame(width: 60, height: 60)
                .background(Color.gray)
                .tint(Color.white)
                .cornerRadius(8)
        }
    }
}

#Preview {
    LoadingView()
}
