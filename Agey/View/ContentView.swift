//
//  ContentView.swift
//  Agey
//
//  Created by AlecNipp on 9/14/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = AgeyViewModel()
    let textFieldBackgroundColor: Color = Color(.sRGBLinear, red: 255, green: 255, blue: 255, opacity: 0.02)
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
                    
                    HStack {
                        Spacer()
                        
                        TextField("Enter name", text: $vm.currentTextEntry)
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .padding(.horizontal, 5)
                            .padding(.vertical)
                            .background(textFieldBackgroundColor, in: RoundedRectangle(cornerRadius: 10))
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                        Spacer()
                    }
                    Button(action: {
                        Task {
                            await vm.fetchAge()
                        }
                    }, label: {
                        Text("Fetch Age")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding(10)
                            .padding(.horizontal, 15)
                            .background(Color.blue, in: Capsule())
                    })
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
