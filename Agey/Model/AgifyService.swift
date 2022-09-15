//
//  AgifyService.swift
//  Agey
//
//  Created by AlecNipp on 9/14/22.
//

import Foundation

class AgifyService {
    
    static func fetchAge(queryName: String) async throws -> AgifyResponse {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.agify.io"
        let queryItemQuery = URLQueryItem(name: "name", value: queryName)
        let queryItemCountry = URLQueryItem(name: "country_id", value: "US")
        
        components.queryItems = [queryItemQuery, queryItemCountry]
        
        guard let url = components.url else { return AgifyResponse.example }
        print(url)
        
        let (data, _) = try await URLSession.shared.data(from: url)
        print(data)
        let nameData = try JSONDecoder().decode(AgifyResponse.self, from: data)
        return nameData
        
        
    }
}
