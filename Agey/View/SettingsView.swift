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
            List {
                Toggle("Show counts", isOn: $vm.showCounts)
                Picker("Country", selection: $vm.currentLocaleCode) {
                    ForEach(Locale.isoRegionCodes, id:\.self) { country in
                        Text(country)
                    }
                }
                
            }
        }
    }
    
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(vm: AgeyViewModel.example)
    }
}
