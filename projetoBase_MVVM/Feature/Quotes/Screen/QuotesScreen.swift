//
//  QuotesScreen.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 10/04/22.
//

import SwiftUI

struct QuotesScreen: View {
    
    @StateObject private var vm = QuotesViewModelImpl(
        service: QuotesServiceImpl()
    )
    
    var body: some View {
        
        Group {
            
            if vm.quotes.isEmpty {
                
                LoadingView(text: "Fetching Posts...")
                
            } else {
                
                List {
                    ForEach(vm.quotes, id: \.id) { item in
                        QuoteView(item: item)
                    }
                }
            }
        }
        .task {
            await vm.getAllQuotes()
        }
    }
}

struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen()
    }
}
