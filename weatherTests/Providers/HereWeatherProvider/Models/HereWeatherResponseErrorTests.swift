//
//  HereWeatherResponseErrorTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class HereWeatherResponseErrorTests: QuickSpec {
    override func spec() {
        describe("HereWeatherResponseError") {
            describe("Decodable.init(from:)") {
                let decoder = JSONDecoder()
                var errorResponse: HereWeatherResponseError?
                var parseError: Error?
                
                context("when provided an error") {
                    let message = "message"
                    let data = HereWeatherResponseDataFixture.ErrorData(message)
                    
                    beforeEach {
                        errorResponse = nil
                        parseError = nil
                        do {
                            errorResponse = try decoder.decode(HereWeatherResponseError.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }
                    
                    it("parses correctly") {
                        expect(parseError).to(beNil())
                    }
                    
                    it("does initialize") {
                        expect(errorResponse).toNot(beNil())
                    }
                    
                    it("does hold the error message") {
                        expect(errorResponse?.error?.localizedDescription).to(equal(message))
                    }
                }

                context("when provided an empty error message") {
                    let data = HereWeatherResponseDataFixture.ErrorData("")

                    beforeEach {
                        errorResponse = nil
                        parseError = nil
                        do {
                            errorResponse = try decoder.decode(HereWeatherResponseError.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }

                    it("parses correctly") {
                        expect(parseError).to(beNil())
                    }

                    it("does initialize") {
                        expect(errorResponse).toNot(beNil())
                    }

                    it("does hold the error message") {
                        expect(errorResponse?.error?.localizedDescription).to(equal("Unknown error"))
                    }
                }

                context("when provided empty data") {
                    let data = HereWeatherResponseDataFixture.EmptyData()
                    
                    beforeEach {
                        errorResponse = nil
                        parseError = nil
                        do {
                            errorResponse = try decoder.decode(HereWeatherResponseError.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }
                    
                    it("does not parse correctly") {
                        expect(parseError).toNot(beNil())
                    }
                    
                    it("does not initialize") {
                        expect(errorResponse).to(beNil())
                    }
                }
                
                context("when provided invalid data") {
                    let data = HereWeatherResponseDataFixture.InvalidErrorData()
                    
                    beforeEach {
                        errorResponse = nil
                        parseError = nil
                        do {
                            errorResponse = try decoder.decode(HereWeatherResponseError.self, from: data)
                        } catch let error {
                            parseError = error
                        }
                    }
                    
                    it("does not parse correctly") {
                        expect(parseError).toNot(beNil())
                    }
                    
                    it("does not initialize") {
                        expect(errorResponse).to(beNil())
                    }
                }
            }
        }
    }
}
