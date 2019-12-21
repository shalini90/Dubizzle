//
//  URLParameterEncoder.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 19/12/19.
//  Copyright © 2019 Shalini Padmanabhan. All rights reserved.
//

import Foundation

public struct URLParameterEncoder: ParameterEncoder {
    
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingUrl }
        
        if var urlComponants = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponants.queryItems    =   [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponants.queryItems?.append(queryItem)
            }
            urlRequest.url  =   urlComponants.url
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}
