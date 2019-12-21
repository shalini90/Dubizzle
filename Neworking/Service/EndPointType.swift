//
//  EndPointType.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 19/12/19.
//  Copyright © 2019 Shalini Padmanabhan. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseUrl: URL { get }
    var path: String? { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

extension EndPointType {
    var baseUrl: URL {
        guard let url = ApiConfig.defaultConfig.url else { fatalError("baseURL could not be configured.")}
        return url
    }
}
