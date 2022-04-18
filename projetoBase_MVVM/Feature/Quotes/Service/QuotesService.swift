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

final class QuotesServiceImpl: QuotesService
{
    func fetch() async throws -> [Quote]
    {
        // testar conexao
        let networkReachability = NetworkReachability()
        print("Is the network reachable? \(networkReachability.reachable)")
        if networkReachability.reachable ==  false
        {
            fatalError("sem rede")
        }
        
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseURL.appending("/posts"))
        let (data, response) = try await urlSession.data(from: url!)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {fatalError("erro")}
        // testar retorno
        return try JSONDecoder().decode([Quote].self, from: data)
    }
}
