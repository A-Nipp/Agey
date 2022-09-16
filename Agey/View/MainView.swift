//
//  MainView.swift
//  Agey
//
//  Created by AlecNipp on 9/16/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = AgeyViewModel()
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.secondaryLabel
        UITabBar.appearance().tintColor = UIColor.secondaryLabel
    }
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
        .accentColor(.primary)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
