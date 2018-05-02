//
//  SevenDaysForecastsViewControllerTests.swift
//  weather
//

import Quick
import Nimble

@testable import weather

class SevenDaysForecastsViewControllerTests: QuickSpec {
    override func spec() {
        describe("SevenDaysForecastsViewController Tests") {
            let dailyForecasts = DailyFoorecastsFixture.DailyForecastsItem()
            let dataSource = FakeSevenDaysForecastsDataSource(forecasts: dailyForecasts)
            var viewController: SevenDaysForecastsViewController!

            beforeSuite {
                viewController = ViewControllerFactory().makeSevenDaysForecastsViewController(dataSource: dataSource)
                _ = viewController.view
            }

            describe("SevenDaysForecastsViewController.viewDidLoad()") {
                it("has a location label") {
                    expect(viewController.locationLabel).toNot(beNil())
                }

                it("shows the location name") {
                    expect(viewController.locationLabel.text).to(equal(dailyForecasts.forecastLocation.city))
                }

                it("has a table view") {
                    expect(viewController.tableView).toNot(beNil())
                }

                it("can display cells of type ForecastTableViewCell") {
                    expect(viewController.tableView.dequeueReusableCell(withIdentifier: UITableViewCellType.forecastTableViewCell.rawValue)).toNot(beNil())
                }

                it("has a table view with a datasource") {
                    expect(viewController.tableView.dataSource).to(beIdenticalTo(dataSource))
                }
            }
        }
    }
}
