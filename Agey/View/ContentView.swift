//
//  ContentView.swift
//  Agey
//
//  Created by AlecNipp on 9/14/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = AgeyViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Text(vm.currentAge ?? "No Results")
                TextField("Enter name", text: $vm.currentTextEntry)
                Button("Fetch age") {
                    Task {
                        await vm.fetchAge()
                    }
                }
            }
            .navigationTitle("Agey")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
