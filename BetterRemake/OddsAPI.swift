//
//  OddsAPI.swift
//  BetterRemake
//
//  Created by Davide Monsurrocco on 10/12/2019.
//  Copyright © 2019 monsud. All rights reserved.
//

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func load(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(self?.decode(data))
        })
        task.resume()
    }
}

class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) -> [Resource.ModelType]? {
        let wrapper = try? JSONDecoder().decode(Wrapper<Resource.ModelType>.self, from: data)
        return wrapper?.items
    }
    
    func load(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}

protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
}

extension APIResource {
    var url: URL {
        var components = URLComponents(string: "https://api.the-odds-api.com/v3/sports/?apiKey=c93589f944e53ab4e760f8d47bea4c53")!
        components.path = methodPath
        return components.url!
    }
}

struct SportsResource: APIResource {
    typealias ModelType = Sports
    let methodPath = "/sports"
}
 
 
