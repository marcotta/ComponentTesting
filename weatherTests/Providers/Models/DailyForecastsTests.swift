//
//  DailyForecastsTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class DailyForecastsTests: QuickSpec {
    override func spec() {
        describe("DailyForecasts Tests") {
            describe("Decodable.init(from:)") {
                let decoder = JSONDecoder()
                var dailyForecast: DailyForecasts?
                var parseError: Error?

                context("when provided valid data") {
                    let data = HereWeatherResponseDataFixture.DailyForecastsData()

                    beforeEach {
                        dailyForecast = nil
                        parseError = nil

                        do {
                            dailyForecast = try decoder.decode(DailyForecasts.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }

                    it("parses successfully") {
                        expect(parseError).to(beNil())
                    }

                    it("initializes correctly") {
                        expect(dailyForecast).toNot(beNil())
                    }
                }

                context("when provided empty data") {
                    let data = HereWeatherResponseDataFixture.EmptyData()

                    beforeEach {
                        dailyForecast = nil
                        parseError = nil

                        do {
                            dailyForecast = try decoder.decode(DailyForecasts.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }

                    it("does not parse correctly") {
                        expect(parseError).toNot(beNil())
                    }

                    it("does not initializes") {
                        expect(dailyForecast).to(beNil())
                    }
                }
                
                context("when provided invalid data") {
                    let data = HereWeatherResponseDataFixture.InvalidDailyForecastsData()

                    beforeEach {
                        dailyForecast = nil
                        parseError = nil

                        do {
                            dailyForecast = try decoder.decode(DailyForecasts.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }

                    it("does not parse correctly") {
                        expect(parseError).toNot(beNil())
                    }

                    it("does not initializes") {
                        expect(dailyForecast).to(beNil())
                    }
                }
            }
        }
    }
}
