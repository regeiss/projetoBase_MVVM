//
//  DetailView.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 21/04/22.
//

import SwiftUI

struct DetailView: View
{
    var corpoTexto: String
    var body: some View
    {
        VStack
        {
            let url = URL(string: "https://via.placeholder.com/150/a9ef52")
            AsyncImage( url: url,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, maxHeight: 100)
                },
                placeholder: { ProgressView()}
            )
    }
        Text(corpoTexto)
            .padding()
    }
}

struct DetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DetailView(corpoTexto: "")
    }
}
