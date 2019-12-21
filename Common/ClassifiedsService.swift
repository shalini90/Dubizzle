//
//  ClassifiedsService.swift
//  DubizzleTests
//
//  Created by Shalini Padmanabhan on 12/22/19.
//  Copyright © Shalini Padmanabhan. All rights reserved.
//

import Foundation

protocol ClassifiedsService {
    func fetchResults(onSuccess: @escaping([ResultItem]) -> Void, onError: @escaping(Error) -> Void)
}
