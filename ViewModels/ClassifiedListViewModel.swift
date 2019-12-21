 //
//  DZClassifiedListViewModel.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 19/12/19.
//  Copyright © Shalini Padmanabhan All rights reserved.
//

import Foundation
 
 class ClassifiedListViewModel {
    var results: [ResultItem] = []
    var searchedResults: [ResultItem] = []
    var service: ClassifiedsService
    
    init(service: ClassifiedsService) {
        self.service = service
    }
    
    func fetchClassifiedList(onSuccess: @escaping() -> Void,
                             onError: @escaping(String) -> Void) {
        service.fetchResults(onSuccess: {[weak self] (results) in
            self? .results = results
            onSuccess()
        }) { (error) in
            onError(error.localizedDescription)
        }        
    }
    
    func search(searchText: String) {
        searchedResults = results.filter { $0.name.contains(searchText)}
    }
    
    func getDataSource(isSearch: Bool) -> [ResultItem] {
        return isSearch ? searchedResults : results
    }
    
 }
