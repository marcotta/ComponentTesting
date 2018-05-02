//
//  URLSessionDataTask.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class URLSessionDataTaskTests: QuickSpec {
    override func spec() {
        describe("URLSessionDataTask Tests") {
            describe("URLSessionDataTaskProtocol") {
                it("conforms to URLSessionDataTaskProtocol") {
                    expect(URLSessionDataTask()).to(beAKindOf(URLSessionDataTaskProtocol.self))
                }
            }
        }
    }
}
