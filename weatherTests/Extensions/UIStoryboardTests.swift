//
//  StringTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class UIStoryboardTests: QuickSpec {
    override func spec() {
        describe("UIStoryboard Tests") {
            let storyBoard = UIStoryboard(.main)
            
            describe("UIStoryboard.init(_:)") {
                it("initializes correctly the main storyaboard") {
                    expect(storyBoard).toNot(beNil())
                }
            }
            
            describe("UIStoryboard.instantiateViewController()") {
                let chooseCityViewController: ChooseCityViewController = storyBoard.instantiateViewController()
                let sevenDaysForecastsViewController: SevenDaysForecastsViewController = storyBoard.instantiateViewController()
                
                it("contains ChooseCityViewController") {
                    expect(chooseCityViewController).toNot(beNil())
                }
                
                it("contains SevenDaysForecastsViewController") {
                    expect(sevenDaysForecastsViewController).toNot(beNil())
                }
            }
        }
    }
}
