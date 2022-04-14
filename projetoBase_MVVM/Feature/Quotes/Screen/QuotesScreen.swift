//
//  QuotesScreen.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 10/04/22.
//

import SwiftUI

struct QuotesScreen: View
{
    
    @StateObject private var vm = QuotesViewModelImpl(service: QuotesServiceImpl())
    @ObservedObject var monitor = NetworkReachability()
    @State private var showAlertSheet = false
    
    var body: some View
    {
        Group
        {
            if vm.quotes.isEmpty
            {
                LoadingView(text: "Fetching Posts...")
            }
            else
            {
                List
                {
                    ForEach(vm.quotes, id: \.id)
                    { item in
                        QuoteView(item: item)
                    }
                }
            }
        }.alert(isPresented: $showAlertSheet, content: {
            if monitor.reachable {
                return Alert(title: Text("Success!"), message: Text("The network request can be performed"), dismissButton: .default(Text("OK")))
            }
            return Alert(title: Text("No Internet Connection"), message: Text("Please enable Wifi or Celluar data"), dismissButton: .default(Text("Cancel")))
        })
        .task
        {
            await vm.getAllQuotes()
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
