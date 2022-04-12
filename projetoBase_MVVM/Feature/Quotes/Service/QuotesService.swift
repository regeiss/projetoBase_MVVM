//
//  QuotesService.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 10/04/22.
//

import Foundation
protocol QuotesService
{
    func fetch() async throws -> [Quote]
}

final class QuotesServiceImpl: QuotesService {
    
    func fetch() async throws -> [Quote]
    {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseURL.appending("/posts"))
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode([Quote].self, from: data)
    }
}
