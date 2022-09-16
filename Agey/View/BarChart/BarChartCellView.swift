//
//  BarChartCellView.swift
//  Agey
//
//  Created by AlecNipp on 9/16/22.
//

import SwiftUI

struct BarChartCellView: View {
    var value: Double
    var barColor: Color
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 5)
            .fill(barColor)
            .scaleEffect(CGSize(width: 1, height: value), anchor: .bottom)
    }
}

struct BarChartCellView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartCellView(value: 3000, barColor: .blue)
            .previewLayout(.sizeThatFits)
    }
}
