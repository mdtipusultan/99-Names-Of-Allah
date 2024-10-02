//
//  AllahNamesModel.swift
//  99NamesOfAllah
//
//  Created by Tipu on 3/10/24.
//

import Foundation

struct AllahName: Identifiable {
    let id = UUID()
    let arabicName: String
    let englishMeaning: String
    let description: String
}
