//
//  DataView.swift
//  Agey
//
//  Created by AlecNipp on 9/16/22.
//

import SwiftUI

struct DataView: View {
    @ObservedObject var vm: AgeyViewModel
    @State var isSorted: Bool = true
    var chartData: [ChartData] {
        var out = [ChartData]()
        for value in vm.savedNames {
            out.append(ChartData(label: value.name, value: Double(value.age ?? 0)))
        }
        return out
    }
    
    var body: some View {
        VStack {
            if vm.savedNames.isEmpty {
                Text("No saved data yet!")
                    .font(.largeTitle)
            }
            else {
                BarChartView(title: "Ages by Name", legend: "idk", barColor: .blue, data: chartData, isSorted: isSorted)
                Toggle("Sort data by age", isOn: $isSorted)
            }
            
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView(vm: AgeyViewModel.example)
    }
}
