//
//  QuotesEndPoint.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 19/04/22.
//

// TODO: ajustar os endpoints 19/04/2022 15:32:03
import Foundation

protocol APIBuilder
{
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum QuoteAPI
{
    case getPosts
}

extension QuoteAPI: APIBuilder
{

    var baseUrl: URL
    {
        switch self
        {
        case .getPosts:
            return URL(string: "https://jsonplaceholder.typicode.com")!
        }
    }
    
    var path: String
    {
        switch self
        {
            case .getPosts:
            return "/posts"
        }
    }
    
    var urlRequest: URLRequest
    {
        switch self
        {
            case .getPosts:
            return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        }
    }
}
