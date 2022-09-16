//
//  ChartData.swift
//  Agey
//
//  Created by AlecNipp on 9/16/22.
//

import Foundation

struct ChartData {
     var label: String
     var value: Double
 }

extension ChartData {
    static var example = [ChartData(label: "Ex 1", value: 100), ChartData(label: "Ex 2", value: 330), ChartData(label: "Ex 3", value: 250)]
}
