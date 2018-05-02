//
//  HereWeatherResponseTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class HereWeatherResponseTests: QuickSpec {
    override func spec() {
        describe("HereWeatherResponse") {
            describe("Decodable.init(from:)") {
                let decoder = JSONDecoder()
                var weatherResponse: HereWeatherResponse?
                var parseError: Error?
                
                context("when provided valid data") {
                    let data = HereWeatherResponseDataFixture.HereWeatherResponseData()
                    
                    beforeEach {
                        weatherResponse = nil
                        parseError = nil
                        do {
                            weatherResponse = try decoder.decode(HereWeatherResponse.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }
                    
                    it("parses correctly") {
                        expect(parseError).to(beNil())
                    }
                    
                    it("initializes correctly") {
                        expect(weatherResponse).toNot(beNil())
                    }
                }
                
                context("when provided empty data") {
                    let data = HereWeatherResponseDataFixture.EmptyData()
                    
                    beforeEach {
                        weatherResponse = nil
                        parseError = nil
                        do {
                            weatherResponse = try decoder.decode(HereWeatherResponse.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }
                    
                    it("does not parse correctly") {
                        expect(parseError).toNot(beNil())
                    }
                    
                    it("does not initialize") {
                        expect(weatherResponse).to(beNil())
                    }
                }
                
                context("when provided invalid data") {
                    let data = HereWeatherResponseDataFixture.InvalidDailyForecastsData()
                    
                    beforeEach {
                        weatherResponse = nil
                        parseError = nil
                        do {
                            weatherResponse = try decoder.decode(HereWeatherResponse.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }
                    
                    it("does not parse correctly") {
                        expect(parseError).toNot(beNil())
                    }
                    
                    it("does not initialize") {
                        expect(weatherResponse).to(beNil())
                    }
                }
            }
        }
    }
}
