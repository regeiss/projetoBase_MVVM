//
//  EmptyView.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 20/04/22.
//

import SwiftUI

struct EmptyView: View
{
    var body: some View
    {
        VStack(spacing: 12)
        {
            Image(systemName: "network.badge.shield.half.filled")
                .foregroundColor(.green)
                .font(.system(size: 50, weight: .heavy))
            Text("Tela inicial")
                .font(.system(size: 30, weight: .heavy))
                .padding(.horizontal, 22)
                .padding(.vertical, 10)
                .font(.system(size: 20, weight: .bold))
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
struct EmptyView_Previews: PreviewProvider
{
    static var previews: some View
    {
        EmptyView()
    }
}
