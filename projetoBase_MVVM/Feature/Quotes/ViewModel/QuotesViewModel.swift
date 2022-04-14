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
    
    @Published private(set) var quotes: [Quote] = []
    
    private let service: QuotesService
    let networkReachability = NetworkReachability()
    
    init(service: QuotesService)
    {
        self.service = service
    }
    
    func getAllQuotes() async
    {
        // TODO: Verificar erros de conexao
        print("Is the network reachable? \(networkReachability.reachable)")
        do
        {
            self.quotes = try await service.fetch()
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
}
