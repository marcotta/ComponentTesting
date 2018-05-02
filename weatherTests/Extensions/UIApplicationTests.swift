//
//  UIApplicationTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class UIApplicationTests: QuickSpec {
    override func spec() {
        describe("UIApplication Tests") {
            describe("NetworkActivityHandling") {
                it("conforms to NetworkActivityHandling") {
                    expect(UIApplication.shared).to(beAKindOf(NetworkActivityHandling.self))
                }
            }
        }
    }
}
