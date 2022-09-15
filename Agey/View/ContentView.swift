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
            ZStack {
                MainViewBackground()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Someone named **\(vm.displayName)** is about")
                        
                    
                    Text("\(vm.displayAge)")
                        .font(.system(size: 80))
                        .fontWeight(.heavy)
                        .padding(.horizontal, 15)

                    Text("years old!")
                    
                    Spacer()
                    
                    TextField("Enter name", text: $vm.currentTextEntry)
                        .padding(.horizontal, 5)
                        .padding(.vertical)
                        .background(.white, in: RoundedRectangle(cornerRadius: 10))
                        .padding()
                    Button("Fetch age") {
                        Task {
                            await vm.fetchAge()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Agey")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
