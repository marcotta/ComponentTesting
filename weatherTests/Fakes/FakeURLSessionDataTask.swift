//
//  FakeURLSessionDataTask.swift
//  weatherTests
//

@testable import weather

class FakeURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var wasResumeCalled = false

    func resume() {
        wasResumeCalled = true
    }
}
