//
//  SideMenuView.swift
//  99NamesOfAllah
//
//  Created by Tipu on 5/10/24.
//
import SwiftUI
struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // App title or logo
            Text("Menu")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 100)
                .padding(.leading, 20)
            
            Spacer()
            
            // Menu items
            VStack(alignment: .leading, spacing: 20) {
                NavigationLink(destination: SettingsView()) {
                    Label("Settings", systemImage: "gearshape")
                        .font(.title3)
                }
                NavigationLink(destination: Text("About View")) {
                    Label("About", systemImage: "info.circle")
                        .font(.title3)
                }
                NavigationLink(destination: Text("Help View")) {
                    Label("Help", systemImage: "questionmark.circle")
                        .font(.title3)
                }
            }
            .padding(.leading, 20)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.7)  // Adjusted to 30% of screen width
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 0)  // Optional shadow for effect
    }
}


#Preview {
    SideMenuView()
}

