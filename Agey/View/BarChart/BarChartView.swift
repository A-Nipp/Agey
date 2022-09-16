//
//  BarChartView.swift
//  Agey
//
//  Created by AlecNipp on 9/16/22.
//

import SwiftUI

struct BarChartView: View {
    
    var title: String
    var legend: String
    var barColor: Color
    var data: [ChartData]
    var isSorted: Bool
    var isShowingDataValues: Bool = true
    
    var normalizedData: [ChartData] {
        var allValues = [Double]()
        for point in data {
            allValues.append(point.value)
        }
        let max = allValues.max() ?? 1
        
        // Create a new list with normalized data points
        var out = [ChartData]()
        
        
        for point in data {
            out.append(ChartData(label: point.label, value: point.value/max))
        }
        
        if isSorted {
            out.sort {
                $0.value < $1.value
            }
        }
        
        return out

    }
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                HStack {
                    //cells
                    ForEach(normalizedData, id:\.label) { point in
                        VStack {
                            BarChartCellView(value: point.value, barColor: barColor)
                                .padding(.horizontal)
                                .padding(.top)
                            Text(point.label)
                                .font(.caption)
                        }
                    }
                }
                // Axes

        }
        .padding()
    }
}


struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(title: "Example", legend: "Legend", barColor: .blue, data: ChartData.example, isSorted: true)
    }
}
