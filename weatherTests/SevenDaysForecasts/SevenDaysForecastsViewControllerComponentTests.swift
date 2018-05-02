//
//  SevenDaysForecastsViewControllerComponentTests.swift
//  weather
//

import Quick
import Nimble

@testable import weather

class SevenDaysForecastsViewControllerComponentTests: QuickSpec {
    override func spec() {
        describe("SevenDaysForecastsViewController Component Tests") {
            let dailyForecasts = DailyFoorecastsFixture.DailyForecastsItem()
            var viewController: SevenDaysForecastsViewController!
            let sectionIndex = 0
            let rowIndex = 0

            beforeSuite {
                viewController = ViewControllerFactory().makeSevenDaysForecastsViewController(forecasts: dailyForecasts)

                _ = viewController.view
            }

            it("correctly initializes") {
                expect(viewController).toNot(beNil())
            }

            it("has a tableView") {
                expect(viewController.tableView).toNot(beNil())
            }

            it("has the correct amount of items") {
                expect(viewController.dataSource?.tableView(viewController.tableView, numberOfRowsInSection: sectionIndex)).to(equal(dailyForecasts.forecastLocation.forecast.count))
            }

            it("loads the correct type of cell") {
                expect(viewController.dataSource?.tableView(viewController.tableView, cellForRowAt: IndexPath(row: rowIndex, section: sectionIndex))).to(beAKindOf(ForecastTableViewCell.self))
            }
        }
    }
}
