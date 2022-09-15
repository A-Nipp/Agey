//
//  AgifyResponse.swift
//  Agey
//
//  Created by AlecNipp on 9/14/22.
//

import Foundation

struct AgifyResponse: Codable {
    let name: String
    let age: Int
    let count: Int
}

extension AgifyResponse {
    static let example = AgifyResponse(name: "Example", age: 25, count: 100)
}
