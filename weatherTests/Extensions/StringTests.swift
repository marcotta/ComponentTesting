//
//  StringTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class StringTests: QuickSpec {
    override func spec() {
        describe("String Tests") {
            describe("String.getter:localized") {
                let text = "CW: City Information Required for product type::expanded_forecast_cw100"
                let localizedText = "City not found"
                
                it("returns the correct localized text") {
                    expect(text.localized).to(equal(localizedText))
                }
            }
        }
    }
}
