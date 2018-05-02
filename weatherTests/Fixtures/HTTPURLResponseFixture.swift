//
//  HTTPURLResponseFixture.swift
//  weatherTests
//

import Foundation

class HTTPURLResponseFixture {

    static func Response(with code: Int) -> HTTPURLResponse {
        return HTTPURLResponse(url: URL(string: "https://weather.cit.api.here.com")!,
                               statusCode: code,
                               httpVersion: nil,
                               headerFields: nil)!
    }
}
