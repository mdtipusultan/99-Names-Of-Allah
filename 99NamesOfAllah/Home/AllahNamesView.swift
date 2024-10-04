//
//  AllahNamesView.swift
//  99NamesOfAllah
//
//  Created by Tipu on 3/10/24.
//

import SwiftUI

struct AllahNamesView: View {
    @ObservedObject var viewModel = AllahNamesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.names) { name in
                        AllahNameCard(name: name)
                    }
                }
                .padding()
            }
            .navigationTitle("99 Names of Allah")
            .background(Color("BackgroundColor"))
        }
    }
}

struct AllahNameCard: View {
    var name: AllahName
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name.arabicName)
                .font(.largeTitle)
                .fontWeight(.bold)
                //.foregroundColor(Color("MainColor"))
                .foregroundColor(Color.white)
            
            Text(name.transliteration)
                .font(.body)
                .foregroundColor(.secondary)
            
            Text(name.englishMeaning)
                .font(.title2)
                .fontWeight(.medium)
                //.foregroundColor(.gray)
            
            
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: [Color("LightBackgroundColor"), Color("MainColor").opacity(0.1)]), startPoint: .top, endPoint: .bottom))
                .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 10)
        )
        .padding(.horizontal)
    }
}


#Preview {
    AllahNamesView()
    //AllahNameCard()
}
