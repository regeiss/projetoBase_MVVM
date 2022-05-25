//
//  QuotesViewModel.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 11/04/22.
//

import Foundation
import os

protocol QuotesViewModel: ObservableObject
{
    func getAllQuotes() async
}

@MainActor
final class QuotesViewModelImpl: QuotesViewModel
{
    private static let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: QuotesViewModelImpl.self))
    
    enum State 
    {
        case na
        case loading
        case success(data: [Quote])
        case failed(error: Error)
    }

    @Published private(set) var quotes: [Quote] = []
    @Published private(set) var state: State = .na
    @Published var hasError: Bool = false
    @Published var carregando: Bool = false
    
    private let service: QuotesService

    init(service: QuotesService)
    {
        self.service = service
    }
    
    func getAllQuotes() async
    {
        self.state = .loading
        self.hasError = false
        self.carregando = true
        
        Self.logger.trace("Iniciando fetch")
        do
        {
            let data = try await service.fetch()
            self.state = .success(data: data)
            self.carregando = false
        }
        catch
        {
            self.state = .failed(error: error)
            self.hasError = true
            self.carregando = false
            Self.logger.error("\(error.localizedDescription, privacy: .public)")
        }
        Self.logger.trace("Finalizando fetch")
    }
}
