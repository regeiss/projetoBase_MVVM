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
        Text(corpoTexto)
    }
}

struct DetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DetailView(corpoTexto: "")
    }
}
