//
//  SevenDaysForecastsDataSourceTests.swift
//  weather
//

import Quick
import Nimble

@testable import weather

class SevenDaysForecastsDataSourceTests: QuickSpec {
    override func spec() {
        describe("SevenDaysForecastsDataSource Tests") {
            let dailyForecasts = DailyFoorecastsFixture.DailyForecastsItem()
            let dataSource = SevenDaysForecastsDataSource(forecasts: dailyForecasts)
            
            describe("SevenDaysForecastsDataSource.init(forecasts:)") {
                it("initializes") {
                    expect(dataSource).toNot(beNil())
                }
                
                it("has the correct city") {
                    expect(dataSource.city).to(equal(dailyForecasts.forecastLocation.city))
                }
            }
            
            describe("SevenDaysForecastsDataSource.tableView(_:numberOfRowsInSection:)") {
                let tableView = UITableView()
                
                it("has the correct number of rows") {
                    expect(dataSource.tableView(tableView, numberOfRowsInSection: 0)).to(equal(dailyForecasts.forecastLocation.forecast.count))
                }
            }
            
            describe("SevenDaysForecastsDataSource.tableView(tableView:cellForRowAt:)") {
                let cell = FakeForecastTableViewCell()
                let tableView: ReusableCellDequeuing = FakeUITableView(withReusableCell: cell)
                let rowIndex = 0
                
                beforeEach {
                    _ = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: rowIndex, section: 0))
                }
                
                it("configures the cell with the correct item") {
                    expect(cell.lastConfiguredForecats).to(equal(dailyForecasts.forecastLocation.forecast[rowIndex]))
                }
            }
        }
    }
}
