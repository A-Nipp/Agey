//
//  AgeyViewModel.swift
//  Agey
//
//  Created by AlecNipp on 9/14/22.
//

import Foundation

class AgeyViewModel: ObservableObject {
    @Published var currentTextEntry: String
    @Published var currentAge: String?
    
    init() {
        self.currentTextEntry = ""
        self.currentAge = nil
    }
    
    func fetchAge() async {
        
    }
}
