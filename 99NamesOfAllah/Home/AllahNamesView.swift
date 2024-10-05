//
//  AllahNamesView.swift
//  99NamesOfAllah
//
//  Created by Tipu on 3/10/24.
//

//import SwiftUI
//import AVFoundation
//
//struct AllahNamesView: View {
//    @ObservedObject var viewModel = AllahNamesViewModel()
//    @State private var searchText: String = ""
//    // State to control the side menu
//    @State private var showMenu = false
//    
//    var filteredNames: [AllahName] {
//        if searchText.isEmpty {
//            return viewModel.names
//        } else {
//            return viewModel.names.filter { $0.arabicName.contains(searchText) || $0.transliteration.lowercased().contains(searchText.lowercased()) }
//        }
//    }
//    
//    var body: some View {
//        ZStack{
//            NavigationView {
//                VStack{
//                    // Custom Search Bar
//                    HStack {
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                        TextField("Search...", text: $searchText)
//                            .foregroundColor(.gray)
//                    }
//                    .padding()
//                    .background(
//                        RoundedRectangle(cornerRadius: 25)
//                            .fill(Color.white)
//                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
//                    )
//                    .padding(.horizontal)
//                    
//                    
//                    
//                    ScrollView {
//                        LazyVStack(spacing: 20) {
//                            ForEach(filteredNames) { name in
//                                AllahNameCard(name: name)
//                            }
//                        }
//                        .padding()
//                    }
//                }
//                .navigationTitle("Asma'ul Husna")
//                .background(Color("BackgroundColor"))
//                
//            }
//        }
//    }
//}

//#Preview {
//    AllahNamesView()
//    //AllahNameCard()
//}


import SwiftUI
import AVFoundation

struct AllahNamesView: View {
    @ObservedObject var viewModel = AllahNamesViewModel()
    @State private var searchText: String = ""
    // State to control the side menu
    @State private var showMenu = false
    
    var filteredNames: [AllahName] {
        if searchText.isEmpty {
            return viewModel.names
        } else {
            return viewModel.names.filter { $0.arabicName.contains(searchText) || $0.transliteration.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        ZStack(alignment: .leading) {  // Aligns content to the left side
            // Main content
            NavigationView {
                VStack {
                    // Custom Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search...", text: $searchText)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    )
                    .padding(.horizontal)
                    
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(filteredNames) { name in
                                AllahNameCard(name: name)
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle("Asma'ul Husna")
                .background(Color("BackgroundColor"))
                .toolbar {
                    // Hamburger menu button
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            
            // Side Menu
            if showMenu {
                SideMenuView()  // Your SideMenuView implementation
                    .frame(width: UIScreen.main.bounds.width * 0.5)
                    .transition(.move(edge: .leading))  // Animates in from the left
                    .zIndex(1)  // Ensure it appears above the main content
            }
        }
        .background(Color.black.opacity(showMenu ? 0.3 : 0))  // Dim background when menu is visible
        .onTapGesture {
            // Close the menu when tapping outside
            if showMenu {
                withAnimation {
                    showMenu = false
                }
            }
        }
    }
}



struct AllahNameCard: View {
    var name: AllahName
    let synthesizer = AVSpeechSynthesizer() // Create speech synthesizer
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(name.arabicName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Text(name.transliteration)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text(name.englishMeaning)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                
            }
            Spacer()
            
            // Voice button
            Button(action: {
                speak(text: name.arabicName) // Call the function to speak the name
            }) {
                Image(systemName: "speaker.wave.2.fill")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .background(Circle().fill(Color.blue))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: [Color("LightBackgroundColor"), Color("MainColor").opacity(0.1)]), startPoint: .top, endPoint: .bottom))
                .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 10)
        )
        .padding(.horizontal)
    }
    
    // Function to speak the name
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA") // Set language to Arabic
        synthesizer.speak(utterance)
    }
}
