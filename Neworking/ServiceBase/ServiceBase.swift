//
//  ServiceBase.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 19/12/19.
//

import Foundation

/*
 Api Response Handling
 */

protocol DataResponderType {
    associatedtype Element: Mappable
    init(success: @escaping (Element) -> Void, error: @escaping (Error) -> Void)
    func bytes(_ responseData: Data)
}


class ApiDataResponder<Element: Mappable>: DataResponderType {
    
    
    var successBlock: ((Element) -> Void)?
    var errorBlock: ((Error) -> Void)?
    
    private init() {
        
    }
    
    required init(success: @escaping (Element) -> Void,
                  error: @escaping (Error) -> Void) {
        self.successBlock = success
        self.errorBlock = error
    }
    
    func bytes(_ responseData: Data) {
        let decoder = JSONDecoder()
        do {
            let element = try decoder.decode(Element.self, from: responseData)
            DispatchQueue.main.async { [weak self] in
                self?.successBlock?(element)
            }
        } catch {
            print(error)
            DispatchQueue.main.async { [weak self] in
                self?.errorBlock?(error)
            }
        }
    }
    
    func error(error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.errorBlock?(error)
        }
    }
    
}
