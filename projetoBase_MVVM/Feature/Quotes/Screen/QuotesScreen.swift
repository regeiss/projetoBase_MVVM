//
//  QuotesScreen.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 10/04/22.
//  Alterado: 19/04/2022 12:59:28

import SwiftUI

struct QuotesScreen: View
{
    @StateObject private var vm = QuotesViewModelImpl(service: QuotesServiceImpl())
    
    var body: some View
    {
        NavigationView
        {
            Group
            {
                switch vm.state
                {
                case .loading:
                    LoadingView(text: "Fetching Posts...")
                    
                case .success(let data):
                    List
                    {
                        ForEach(data, id: \.id)
                        { item in
                            NavigationLink(destination: DetailView(), label: {
                                HStack
                                {
                                     Image(systemName: "character.bubble.fill")
                                         .font(.system(size: 16, weight: .black))
                                     Text(String(item.id))
                                 }})
                            QuoteView(item: item)
                        }
                    }
                default:
                    EmptyView()
                }
            }
            .alert("Error",
                isPresented: $vm.hasError, presenting: vm.state) { detail in Button("Retry", role: .destructive)
                    { Task {await vm.getAllQuotes()}}}
                message: { detail in if case let .failed(error) = detail { Text(error.localizedDescription)}}
            .task
                { await vm.getAllQuotes()}
            .navigationTitle("Postagens")
            .navigationBarTitleDisplayMode(.inline)
            .refreshable { await vm.getAllQuotes()}  //?
        }
    }
}

struct QuotesScreen_Previews: PreviewProvider
{
    static var previews: some View
    {
        QuotesScreen()
    }
}
