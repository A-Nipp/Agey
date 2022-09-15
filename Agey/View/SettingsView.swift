//
//  SettingsView.swift
//  Agey
//
//  Created by AlecNipp on 9/15/22.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var vm: AgeyViewModel
    var body: some View {
        ZStack {
            MainViewBackground()
                .ignoresSafeArea()
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(vm: AgeyViewModel.example)
    }
}
