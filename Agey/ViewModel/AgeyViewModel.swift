//
//  AgeyViewModel.swift
//  Agey
//
//  Created by AlecNipp on 9/14/22.
//

import Foundation
@MainActor
class AgeyViewModel: ObservableObject {
    @Published var currentTextEntry: String
    @Published var currentData: AgifyResponse?
    @Published var currentLocale: Locale
    var displayAge: String {
        if currentData != nil {
            if currentData!.age != nil {
                return String(currentData!.age!)
            }
        }
        return "No Data"
    }
    
    var displayName: String {
        if currentData != nil {
            return String(currentData!.name)
        }
        else {
            return "No Name"
        }
    }
    
    init() {
        self.currentTextEntry = ""
        self.currentData = nil
        self.currentLocale = Locale.current
    }
    
    func fetchAge() async {
        do {
            currentData = try await AgifyService.fetchAge(queryName: currentTextEntry)
        }
        catch {
            print(String(describing: error))
            currentData = nil
        }
    }
    
}

extension AgeyViewModel {
    static var example: AgeyViewModel {
        let ex = AgeyViewModel()
        ex.currentData = AgifyResponse.example
        return ex
    }
}
