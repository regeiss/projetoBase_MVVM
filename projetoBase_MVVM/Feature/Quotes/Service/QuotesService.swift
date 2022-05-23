//
//  QuotesService.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 10/04/22.
//  Alterado 19/04/2022 13:21:36

import Foundation
import os

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
    private static let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: QuotesViewModelImpl.self))
    
    func fetch() async throws -> [Quote]
        {
            
            let urlSession = URLSession.shared
            let url = URL(string: APIConstants.baseURL.appending("/posts"))
            let (data, _) = try await urlSession.data(from: url!)
            
            //Self.logger.error("\(error.localizedDescription, privacy: .public)")
            return try JSONDecoder().decode([Quote].self, from: data)
            //Self.logger.error("\(error.localizedDescription, privacy: .public)")
        }
}
