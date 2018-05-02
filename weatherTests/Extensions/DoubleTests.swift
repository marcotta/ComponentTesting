//
//  StringTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class DoubleTests: QuickSpec {
    override func spec() {
        describe("Double Tests") {
            describe("Double.getter:temperature") {
                
                context("when first decimal digit is less than .5") {
                    it("returns value rounded down and adds degree symbol") {
                        expect(12.4.temperature).to(equal("12°"))
                    }
                }
                
                context("when first decimal digit is .5") {
                    it("returns value rounded down and adds degree symbol") {
                        expect(12.5.temperature).to(equal("12°"))
                    }
                }
                
                context("when first decimal digit is greater than .5") {
                    it("returns value rounded up and adds degree symbol") {
                        expect(12.6.temperature).to(equal("13°"))
                    }
                }
            }
        }
    }
}
