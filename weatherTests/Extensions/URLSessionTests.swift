//
//  URLSessionTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class URLSessionTests: QuickSpec {
    override func spec() {
        describe("URLSession Tests") {
            describe("URLSessionProtocol") {
                it("conforms to URLSessionProtocol") {
                    expect(URLSession()).to(beAKindOf(URLSessionProtocol.self))
                }
            }
        }
    }
}
