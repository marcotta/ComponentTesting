//
//  ForecastTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class ForecastTests: QuickSpec {
    override func spec() {
        describe("Forecast Tests") {
            describe("Decodable.init(from:)") {
                let decoder = JSONDecoder()
                var forecast: Forecast?
                var parseError: Error?
                
                context("when provided valid data") {
                    let data = HereWeatherResponseDataFixture.ForecastData()
                    
                    beforeEach {
                        forecast = nil
                        parseError = nil
                        
                        do {
                            forecast = try decoder.decode(Forecast.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }
                    
                    it("parses successfully") {
                        expect(parseError).to(beNil())
                    }
                    
                    it("initializes correctly") {
                        expect(forecast).toNot(beNil())
                    }
                }
                
                context("when provided empty data") {
                    let data = HereWeatherResponseDataFixture.EmptyData()
                    
                    beforeEach {
                        forecast = nil
                        parseError = nil
                        
                        do {
                            forecast = try decoder.decode(Forecast.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }
                    
                    it("does not parse correctly") {
                        expect(parseError).toNot(beNil())
                    }
                    
                    it("does not initializes") {
                        expect(forecast).to(beNil())
                    }
                }
                
                context("when provided invalid data") {
                    let data = HereWeatherResponseDataFixture.InvalidForecastData()
                    
                    beforeEach {
                        forecast = nil
                        parseError = nil
                        
                        do {
                            forecast = try decoder.decode(Forecast.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }
                    
                    it("does not parse correctly") {
                        expect(parseError).toNot(beNil())
                    }
                    
                    it("does not initializes") {
                        expect(forecast).to(beNil())
                    }
                }
            }
        }
    }
}
