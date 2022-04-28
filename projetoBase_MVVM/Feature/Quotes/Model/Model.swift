//
//  Model.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 10/04/22.
//

import Foundation

struct Quote: Decodable
{
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

extension Quote
{
    static var dummyData: [Quote]
    {
        [Quote(userId: 1, id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et susm rerum est autem sunt rem eveniet architecto")]
    }
}
