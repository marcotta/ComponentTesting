//
//  FakeURLSession.swift
//  weatherTests
//

import Foundation

@testable import weather

class FakeURLSession: URLSessionProtocol {

    private (set) var lastRequest: URLRequest?
    var dataToReturn: Data?
    var responseToReturn: URLResponse?
    var errorToReturn: Error?
    private var dataTask: URLSessionDataTaskProtocol

    init(dataTask: URLSessionDataTaskProtocol) {
        self.dataTask = dataTask
    }

    func dataTask(with request: URLRequest,
                  completionHandler: @escaping URLSessionCompletionHandler) -> URLSessionDataTaskProtocol {
        lastRequest = request
        completionHandler(dataToReturn, responseToReturn, errorToReturn)

        return dataTask
    }
}


