//
//  AllahNamesViewModel.swift
//  99NamesOfAllah
//
//  Created by Tipu on 3/10/24.
//

import Foundation

class AllahNamesViewModel: ObservableObject {
    @Published var names: [AllahName] = []
    
    init() {
        loadNames()
    }
    
    func loadNames() {
        names = [
            AllahName(arabicName: "الرَّحْمَنُ", englishMeaning: "The Beneficent", description: "The One who gives blessings and prosperity to all beings."),
            AllahName(arabicName: "الرَّحِيمُ", englishMeaning: "The Merciful", description: "The One who gives mercy and forgiveness to all."),
            // Add all 99 names here
        ]
    }
}
