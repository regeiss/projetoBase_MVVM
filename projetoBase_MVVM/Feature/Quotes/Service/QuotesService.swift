//
//  QuotesService.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 10/04/22.
//  Alterado 19/04/2022 13:21:36

import Foundation

enum QuotesServiceError: Error 
{
    case failed
    case failedToDecode
    case invalidServerResponse
}

protocol QuotesService
{
    func fetch() async throws -> [Quote]
}

final class QuotesServiceImpl: QuotesService
{
//    func fetch() async throws -> [Quote]
//    {
//        let urlSession = URLSession.shared
//        let url = URL(string: APIConstants.baseURL.appending("/posts"))
//        let (data, response) = try await urlSession.data(from: url!)
//
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200
//        else
//        {
//            throw QuotesServiceError.invalidServerResponse
//        }
//
//        guard let data = data
//        else
//        {
//           throw QuotesServiceError.invalidServerResponse
//        }
//
//        guard case let quotes as? [Quote] = try? JSONDecoder().decode(.self, from: data)
//        else
//              {
//                  throw QuotesServiceError.failedToDecode
//              }
//
//        return quotes
//    }
    
    func fetch() async throws -> [Quote]
        {
            let urlSession = URLSession.shared
            let url = URL(string: APIConstants.baseURL.appending("/posts"))
            let (data, _) = try await urlSession.data(from: url!)
            return try JSONDecoder().decode([Quote].self, from: data)
        }
}
