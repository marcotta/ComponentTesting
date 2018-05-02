//
//  HereWeatherProviderTestsTests.swift
//  weather
//

import Quick
import Nimble

@testable import weather

class HereWeatherProviderTests: QuickSpec {
    override func spec() {
        describe("HereWeatherProvider") {
            let appId = "test appId"
            let appCode = "test appCode"
            var fakeURLSessionDataTask: FakeURLSessionDataTask!
            var fakeURLSession: FakeURLSession!
            let weatherProviderConfiguration = HereWeatherProviderConfiguration(appId: appId, appCode: appCode)
            var weatherProvider: HereWeatherProvider!

            beforeEach {
                fakeURLSessionDataTask = FakeURLSessionDataTask()
                fakeURLSession = FakeURLSession(dataTask: fakeURLSessionDataTask)
            }

            describe("HereWeatherProvider.init()") {
                beforeEach {
                    weatherProvider = HereWeatherProvider()
                }

                it("exists") {
                    expect(weatherProvider).toNot(beNil())
                }

                it("conforms to SevenDaysWeatherForecastProvider protocol") {
                    expect(weatherProvider).to(beAKindOf(SevenDaysWeatherForecastProvider.self))
                }

                it("correctly initializes a default session") {
                    expect(weatherProvider.urlSession).toNot(beNil())
                }

                it("correctly initializes a default configuration") {
                    expect(weatherProvider.configuration).toNot(beNil())
                }
            }

            describe("HereWeatherProvider.init(configuration:urlSession:)") {
                beforeEach {
                    weatherProvider = HereWeatherProvider(configuration: weatherProviderConfiguration, urlSession: fakeURLSession)
                }

                it("exists") {
                    expect(weatherProvider).toNot(beNil())
                }

                it("correctly initializes a session") {
                    expect(weatherProvider.urlSession).toNot(beNil())
                }

                it("correctly initializes a configuration") {
                    expect(weatherProvider.configuration).toNot(beNil())
                }
            }

            describe("SevenDaysWeatherForecastProvider.findForecast(city:completion:)") {
                let city = "Chicago"

                beforeEach {
                    weatherProvider = HereWeatherProvider(configuration: weatherProviderConfiguration, urlSession: fakeURLSession)
                }

                context("and it creates a request") {
                    var components: URLComponents?
                    var retrievedError: Error?
                    var retrievedForecasts: DailyForecasts?

                    beforeEach {
                        weatherProvider.findForecast(with: city, completion: nil)

                        guard let url = fakeURLSession.lastRequest?.url else {
                            return
                        }
                        components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                    }

                    it("creates a request") {
                        expect(fakeURLSession.lastRequest).toNot(beNil())
                    }

                    it("uses the correct scheme") {
                        expect(components?.scheme).to(equal("https"))
                    }

                    it("uses the correct host") {
                        expect(components?.host).to(equal("weather.cit.api.here.com"))
                    }

                    it("uses the correct path") {
                        expect(components?.path).to(equal("/weather/1.0/report.json"))
                    }

                    it("uses the correct appId") {
                        expect(components?.queryItems).to(contain(URLQueryItem(name: "app_id", value: appId)))
                    }

                    it("uses the correct appCode") {
                        expect(components?.queryItems).to(contain(URLQueryItem(name: "app_code", value: appCode)))
                    }

                    it("uses the correct product") {
                        expect(components?.queryItems).to(contain(URLQueryItem(name: "product", value: "forecast_7days_simple")))
                    }

                    it("uses the correct city") {
                        expect(components?.queryItems).to(contain(URLQueryItem(name: "name", value: city)))
                    }

                    it("executes the network calls") {
                        expect(fakeURLSessionDataTask.wasResumeCalled).to(beTruthy())
                    }

                    context("and receives an error") {
                        let errorMessage = "Test Error"

                        beforeEach {
                            fakeURLSession.errorToReturn = CustomError(errorMessage)
                            weatherProvider.findForecast(with: city, completion: { (_ forecasts, _ error) in
                                retrievedError = error
                                retrievedForecasts = forecasts
                            })
                        }

                        it("retrieves the error with the correct message") {
                            expect(retrievedError?.localizedDescription).to(equal(errorMessage))
                        }
                    }

                    context("and receives a valid response") {
                        beforeEach {
                            fakeURLSession.responseToReturn = HTTPURLResponseFixture.Response(with: 200)
                            fakeURLSession.dataToReturn = HereWeatherResponseDataFixture.HereWeatherResponseData()
                            weatherProvider.findForecast(with: city, completion: { (_ forecasts, _ error) in
                                retrievedError = error
                                retrievedForecasts = forecasts
                            })
                        }

                        it("does not receive an error") {
                            expect(retrievedError).to(beNil())
                        }

                        it("receives a forecasts") {
                            expect(retrievedForecasts).toNot(beNil())
                        }
                    }

                    context("and receives an invalid response") {
                        beforeEach {
                            fakeURLSession.responseToReturn = HTTPURLResponseFixture.Response(with: 200)
                            fakeURLSession.dataToReturn = HereWeatherResponseDataFixture.InvalidDailyForecastsData()
                            weatherProvider.findForecast(with: city, completion: { (_ forecasts, _ error) in
                                retrievedError = error
                                retrievedForecasts = forecasts
                            })
                        }

                        it("receives an error") {
                            expect(retrievedError).toNot(beNil())
                        }

                        it("receives the correct error message") {
                            expect(retrievedError?.localizedDescription).to(equal("Unable to parse data"))
                        }

                        it("does not receives a forecast") {
                            expect(retrievedForecasts).to(beNil())
                        }
                    }

                    context("and receives no response") {
                        beforeEach {
                            fakeURLSession.responseToReturn = HTTPURLResponseFixture.Response(with: 200)
                            fakeURLSession.dataToReturn = nil
                            weatherProvider.findForecast(with: city, completion: { (_ forecasts, _ error) in
                                retrievedError = error
                                retrievedForecasts = forecasts
                            })
                        }

                        it("receives an error") {
                            expect(retrievedError).toNot(beNil())
                        }

                        it("does not receive forecasts") {
                            expect(retrievedForecasts).to(beNil())
                        }
                    }

                    context("and receives an error response") {
                        let errorMessage = "Error Message"

                        beforeEach {
                            fakeURLSession.responseToReturn = HTTPURLResponseFixture.Response(with: 400)
                            fakeURLSession.dataToReturn = HereWeatherResponseDataFixture.ErrorData(errorMessage)
                            weatherProvider.findForecast(with: city, completion: { (_ forecasts, _ error) in
                                retrievedError = error
                                retrievedForecasts = forecasts
                            })
                        }

                        it("receives an error") {
                            expect(retrievedError).toNot(beNil())
                        }

                        it("receives the correct error message") {
                            expect(retrievedError?.localizedDescription).to(equal(errorMessage))
                        }

                        it("does not receive forecasts") {
                            expect(retrievedForecasts).to(beNil())
                        }
                    }

                    context("and receives an invalid error response") {
                        beforeEach {
                            fakeURLSession.responseToReturn = HTTPURLResponseFixture.Response(with: 400)
                            fakeURLSession.dataToReturn = HereWeatherResponseDataFixture.InvalidErrorData()
                            weatherProvider.findForecast(with: city, completion: { (_ forecasts, _ error) in
                                retrievedError = error
                                retrievedForecasts = forecasts
                            })
                        }

                        it("receives an error") {
                            expect(retrievedError).toNot(beNil())
                        }

                        it("receives the correct error message") {
                            expect(retrievedError?.localizedDescription).to(equal("Unable to parse data"))
                        }

                        it("does not receive forecasts") {
                            expect(retrievedForecasts).to(beNil())
                        }
                    }
                }
            }
        }
    }
}
