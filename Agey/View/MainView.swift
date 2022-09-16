//
//  MainView.swift
//  Agey
//
//  Created by AlecNipp on 9/16/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = AgeyViewModel()
    var body: some View {
        TabView {
            ContentView(vm: vm)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            DataView(vm: vm)
                .tabItem {
                    Label("Data", systemImage: "chart.bar.xaxis")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
