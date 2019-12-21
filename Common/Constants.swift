//
//  Constants.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 21/12/19.
//  Copyright © Shalini Padmanabhan All rights reserved.
//

import Foundation

struct ApiConstants {
    static let resultsUrl = "ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
}

enum AppError {
    case unknown
}

extension AppError {
    var code: Int {
        return 101
    }
}
extension AppError {
    var description: String {
        return "Network Error Occured, Please try again later"
    }
}
