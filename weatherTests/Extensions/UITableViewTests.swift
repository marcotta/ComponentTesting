//
//  UITableViewTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class UITableViewTests: QuickSpec {
    override func spec() {
        describe("UITableView Tests") {
            describe("ReusableCellDequeuing") {
                it("conforms to ReusableCellDequeuing") {
                    expect(UITableView()).to(beAKindOf(ReusableCellDequeuing.self))
                }
            }
        }
    }
}
