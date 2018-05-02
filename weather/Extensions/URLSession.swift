//
//  URLSessionProtocol.swift
//  weather
//

import Foundation

typealias URLSessionCompletionHandler = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionCompletionHandler) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionCompletionHandler) -> URLSessionDataTaskProtocol {

        let task: URLSessionDataTask = dataTask(with: request, completionHandler: completionHandler)

        return task as URLSessionDataTaskProtocol
    }
}
