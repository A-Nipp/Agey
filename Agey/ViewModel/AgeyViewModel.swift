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
    var displayAge: String {
        if currentData != nil {
            return String(currentData!.age)
        }
        else {
            return "No Data"
        }
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
