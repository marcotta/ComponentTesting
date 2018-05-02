//
//  ForecastLocationTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class ForecastLocationTests: QuickSpec {
    override func spec() {
        describe("ForecastLocation Tests") {
            describe("Decodable.init(from:)") {
                let decoder = JSONDecoder()
                var forecastLocation: ForecastLocation?
                var parseError: Error?

                context("when provided valid data") {
                    let data = HereWeatherResponseDataFixture.ForecastLocationData()

                    beforeEach {
                        forecastLocation = nil
                        parseError = nil

                        do {
                            forecastLocation = try decoder.decode(ForecastLocation.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }

                    it("parses successfully") {
                        expect(parseError).to(beNil())
                    }

                    it("initializes correctly") {
                        expect(forecastLocation).toNot(beNil())
                    }
                }

                context("when provided empty data") {
                    let data = HereWeatherResponseDataFixture.EmptyData()

                    beforeEach {
                        forecastLocation = nil
                        parseError = nil

                        do {
                            forecastLocation = try decoder.decode(ForecastLocation.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }

                    it("does not parse correctly") {
                        expect(parseError).toNot(beNil())
                    }

                    it("does not initializes") {
                        expect(forecastLocation).to(beNil())
                    }
                }

                context("when provided invalid data") {
                    let data = HereWeatherResponseDataFixture.InvalidForecastLocationData()

                    beforeEach {
                        forecastLocation = nil
                        parseError = nil

                        do {
                            forecastLocation = try decoder.decode(ForecastLocation.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }

                    it("does not parse correctly") {
                        expect(parseError).toNot(beNil())
                    }

                    it("does not initializes") {
                        expect(forecastLocation).to(beNil())
                    }
                }
            }
        }
    }
}
