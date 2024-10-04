//
//  SplashView.swift
//  99NamesOfAllah
//
//  Created by Tipu on 4/10/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            AllahNamesView() // Navigate to your main view after the splash
        } else {
            VStack {
                //Image(systemName: "leaf.fill") // Use your app's icon
                Image("splash_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color("MainColor"))
                
                Text("99 Names of Allah")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 1.0
                    self.opacity = 1.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

