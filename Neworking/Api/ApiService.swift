//
//  ApiService.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 19/12/19.
//

import Foundation


public enum ApiScheme: String {
    case http, https
}

public struct ApiConfig {
    let baseUrl: String
    let scheme: ApiScheme
    
    public init(scheme: ApiScheme, baseUrl: String) {
        self.scheme = scheme
        self.baseUrl = baseUrl
    }
}

extension ApiConfig {
    static var defaultConfig: ApiConfig {
       return ApiConfig(scheme: .https, baseUrl: ApiConstants.resultsUrl)
    }
    var url: URL? {
        return URL(string: scheme.rawValue + "://" + baseUrl)
    }
}
public class ApiService: ClassifiedsService {
 
    private let router = Router<ResultsEndPoint>()
    
    func fetchResults(onSuccess: @escaping([ResultItem]) -> Void, onError: @escaping(Error) -> Void) {
       
        let success : (Classifieds) -> Void = { classifieds in
            onSuccess(classifieds.getClassifiedList())
        }
        router.request(ResultsEndPoint.getResults,
                       dataResponder: ApiDataResponder<Classifieds>.init(success: success,
                                                                         error: onError))
    }

}

