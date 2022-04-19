//
//  QuotesViewModel.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 11/04/22.
//

import Foundation

protocol QuotesViewModel: ObservableObject
{
    func getAllQuotes() async
}

@MainActor
final class QuotesViewModelImpl: QuotesViewModel
{
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
    
    private let service: QuotesService

    init(service: QuotesService)
    {
        self.service = service
    }
    
    func getAllQuotes() async
    {
        self.state = .loading
        self.hasError = false
        do
        {
            //self.quotes = try await service.fetch()
            let data = try await service.fetch()
            self.state = .success(data: data)
        }
        catch
        {
            self.state = .failed(error: error)
            self.hasError = true
        }
    }
}
