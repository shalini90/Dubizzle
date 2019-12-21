//
//  MovieEndPoint.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 19/12/19.
//

import Foundation

enum ResultsEndPoint {
    case getResults
}

extension ResultsEndPoint: EndPointType {
    var path: String? {
        return nil
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
       return .request
    }
    
    
    var headers: HTTPHeaders? {
        return nil
    }
}
