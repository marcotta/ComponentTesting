//
//  ForecastTableViewCellTests.swift
//  weather
//

import Quick
import Nimble

@testable import weather

class ForecastTableViewCellTests: QuickSpec {
    override func spec() {
        describe("ForecastTableViewCell Tests") {
            let cell = Bundle.main.loadNibNamed(UITableViewCellType.forecastTableViewCell.rawValue, owner: nil, options: nil)?.first as! ForecastTableViewCell

            it("exists") {
                expect(cell).toNot(beNil())
            }

            it("is a ForecastTableViewCell") {
                expect(cell).to(beAKindOf(ForecastTableViewCell.self))
            }

            describe("ForecastTableViewCell.configure(with:)") {
                let forecast = DailyFoorecastsFixture.ForecastItem()

                beforeEach {
                    cell.configure(with: forecast)
                }

                it("correctly shows the weekday") {
                    expect(cell.weekdayLabel.text).to(equal(forecast.weekday))
                }

                it("correctly shows the high temperature") {
                    expect(cell.highTemperatureLabel.text).to(equal(forecast.highTemperature.temperature))
                }

                it("correctly shows the low temperature") {
                    expect(cell.lowTemperatureLabel.text).to(equal(forecast.lowTemperature.temperature))
                }
            }
        }
    }
}
