//
//  UINavigationControllerTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class UINavigationControllerTests: QuickSpec {
    override func spec() {
        describe("UINavigationController Tests") {
            describe("UINavigationControllerProtocol") {
                it("conforms to UINavigationControllerProtocol") {
                    expect(UINavigationController()).to(beAKindOf(UINavigationControllerProtocol.self))
                }
            }
        }
    }
}
