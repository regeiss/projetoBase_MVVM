//
//  QuotesScreen.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 10/04/22.
//

import SwiftUI

struct QuoteView: View
{
    
    
     let item: Quote
     
     var body: some View {
         VStack(alignment: .leading,
                spacing: 8) {
             HStack {
                 Image(systemName: "tv")
                     .font(.system(size: 12, weight: .black))
                 Text(String(item.id))
             }
             
             Text(makeAttributedString(title:"ID", label:String(item.userId)))
             Text(makeAttributedString(title:"Title", label: item.title))
             Text(makeAttributedString(title:"Body", label: item.body))
         }
         .padding()
         .foregroundColor(.black)
     }
    
    private func makeAttributedString(title: String, label: String) -> AttributedString {
        
        var string = AttributedString("\(title): \(label)")
        string.foregroundColor = .black
        string.font = .system(size: 16, weight: .bold)
        
        if let range = string.range(of: label) {
            string[range].foregroundColor = .black.opacity(0.8)
            string[range].font = .system(size: 16, weight: .regular)

        }
        return string
    }
}

struct QuoteView_Previews: PreviewProvider
{
    static var previews: some View {
        QuoteView(item: Quote.dummyData.first!)
            .preview(displayName: "Quote View")
    }
}
