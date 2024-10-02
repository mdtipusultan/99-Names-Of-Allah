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
                .foregroundColor(Color("PrimaryColor"))
            
            Text(name.englishMeaning)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.gray)
            
            Text(name.description)
                .font(.body)
                .foregroundColor(.secondary)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: [Color("LightBackgroundColor"), Color("PrimaryColor").opacity(0.1)]), startPoint: .top, endPoint: .bottom))
                .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 10)
        )
        .padding(.horizontal)
    }
}


#Preview {
    AllahNamesView()
}
