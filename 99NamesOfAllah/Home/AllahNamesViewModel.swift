////
////  AllahNamesViewModel.swift
////  99NamesOfAllah
////
////  Created by Tipu on 3/10/24.
////
//
//import Foundation
//
//class AllahNamesViewModel: ObservableObject {
//    @Published var names: [AllahName] = []
//    
//    init() {
//        loadNames()
//    }
//    
//    func loadNames() {
//        names = [
//            AllahName(arabicName: "الرَّحْمَنُ", englishMeaning: "The Beneficent", description: "The One who gives blessings and prosperity to all beings."),
//            AllahName(arabicName: "الرَّحِيمُ", englishMeaning: "The Merciful", description: "The One who gives mercy and forgiveness to all."),
//            // Add all 99 names here
//        ]
//    }
//}

import Foundation

import Foundation

class AllahNamesViewModel: ObservableObject {
    @Published var names: [AllahName] = []
    
    init() {
        fetchNamesFromAPI()
    }
    
    func fetchNamesFromAPI() {
        guard let url = URL(string: "https://api.aladhan.com/v1/asmaAlHusna") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.names = decodedResponse.data.map { AllahName(arabicName: $0.name, englishMeaning: $0.en.meaning, description: $0.en.description ?? "No description available") }
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }
}


struct APIResponse: Codable {
    let code: Int
    let status: String
    let data: [AllahNameResponse]
}

struct AllahNameResponse: Codable {
    let name: String
    let transliteration: String
    let en: EnglishTranslation
}

struct EnglishTranslation: Codable {
    let meaning: String
    let description: String? // Make this optional
}

