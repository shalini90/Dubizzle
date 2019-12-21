//
//  MockApiService.swift
//  DubizzleTests
//
//  Created by Shalini Padmanabhan on 12/22/19.
//  Copyright © Shalini Padmanabhan. All rights reserved.
//

import Foundation

class MockApiService {
    var fetchResultsCalled = false
    var shouldReturnError = false
    var parseFailed = false
    
    enum MockError: Error {
        case fetchError
        case parseError
    }
    
    func reset() {
        fetchResultsCalled = false
        shouldReturnError = false
        parseFailed = false
    }
}

extension MockApiService: ClassifiedsService {
    
    func fetchResults(onSuccess: @escaping ([ResultItem]) -> Void, onError: @escaping (Error) -> Void) {
        fetchResultsCalled = true
        if shouldReturnError {
            parseFailed = true
            onError(MockError.fetchError)
        } else {
            let testBundle = Bundle(for: type(of: self))
            let filePath = testBundle.path(forResource: "mockjson", ofType: "json")

            if let path = filePath {
                 do {
                     let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                     let decoder = JSONDecoder()
                     let element = try decoder.decode(Classifieds.self, from: data)
                    onSuccess(element.results.map { $0.asResultItem() })
                 }catch {
                    parseFailed = true
                    onError(MockError.parseError)
                  }
            }
        }
    }
}

