//
//  FakeNetworkActivityHandling.swift
//  weatherTests
//

@testable import weather

class FakeNetworkActivityHandler: NetworkActivityHandling {

    private (set) var status: [Bool]

    var isNetworkActivityIndicatorVisible: Bool {
        willSet {
            status.append(newValue)
        }
    }

    init() {
        isNetworkActivityIndicatorVisible = false
        status = [Bool]()
    }
}
