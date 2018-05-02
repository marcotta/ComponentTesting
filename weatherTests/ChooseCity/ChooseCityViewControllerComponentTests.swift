//
//  ChooseCityViewControllerComponentTests.swift
//  weather
//

import Quick
import Nimble

@testable import weather

class ChooseCityViewControllerComponentTests: QuickSpec {
    override func spec() {

        describe("ChooseCityViewController Component Tests") {
            var viewController: ChooseCityViewController!
            let fakeURLSession = FakeURLSession(dataTask: FakeURLSessionDataTask())
            var navigationController: UINavigationController!

            beforeSuite {
                navigationController = ViewControllerFactory().makeInitialViewController()
                viewController = navigationController.visibleViewController as! ChooseCityViewController

                _ = viewController.view
            }

            context("when tapping send button") {
                context("and city text field has a value") {
                    let city = "Berlin"

                    beforeEach {
                        viewController.cityTextField.text = city
                    }

                    context("and it receives no error from the api") {
                        beforeEach {
                            fakeURLSession.responseToReturn = HTTPURLResponseFixture.Response(with: 200)
                        }

                        context("and the response contains valid data") {
                            beforeEach{
                                fakeURLSession.dataToReturn = HereWeatherResponseDataFixture.HereWeatherResponseData()
                                viewController.sevenDaysWeatherForecastProvider = HereWeatherProvider(configuration: HereWeatherProviderConfiguration(), urlSession: fakeURLSession)

                                viewController.sendButton.sendActions(for: .touchUpInside)
                            }

                            it("shows the forecasts screen") {
                                expect(navigationController.visibleViewController).toEventually(beAKindOf(SevenDaysForecastsViewController.self))
                            }
                        }

                        context("and the response contains invalid data") {
                            let errorMessage = "Unable to parse data"
                            let fakeAlertPresenter = FakeAlertPresenter()

                            beforeEach {
                                viewController.alertPresenter = fakeAlertPresenter
                                fakeURLSession.dataToReturn = HereWeatherResponseDataFixture.InvalidDailyForecastsData()
                                viewController.sevenDaysWeatherForecastProvider = HereWeatherProvider(configuration: HereWeatherProviderConfiguration(), urlSession: fakeURLSession)

                                viewController.sendButton.sendActions(for: .touchUpInside)
                            }

                            it("displays an alert with correct error message") {
                                expect(fakeAlertPresenter.lastAlertController?.message).to(equal(errorMessage.localized))
                            }
                        }
                    }

                    context("and it receives an error from the api") {
                        let fakeAlertPresenter = FakeAlertPresenter()

                        beforeEach{
                            viewController.alertPresenter = fakeAlertPresenter
                            fakeURLSession.responseToReturn = HTTPURLResponseFixture.Response(with: 400)
                        }

                        context("and the response contains valid data") {
                            context("and has an error message") {
                                let errorMessage = "there was an error from the api"

                                beforeEach {
                                    fakeURLSession.dataToReturn = HereWeatherResponseDataFixture.ErrorData(errorMessage)
                                    viewController.sevenDaysWeatherForecastProvider = HereWeatherProvider(configuration: HereWeatherProviderConfiguration(), urlSession: fakeURLSession)

                                    viewController.sendButton.sendActions(for: .touchUpInside)
                                }

                                it("displays an alert with the correct error message") {
                                    expect(fakeAlertPresenter.lastAlertController?.message).to(equal(errorMessage.localized))
                                }
                            }

                            context("and does not have an error message") {
                                let errorMessage = "Unknown error"

                                beforeEach {
                                    fakeURLSession.dataToReturn = HereWeatherResponseDataFixture.ErrorData("")
                                    viewController.sevenDaysWeatherForecastProvider = HereWeatherProvider(configuration: HereWeatherProviderConfiguration(), urlSession: fakeURLSession)

                                    viewController.sendButton.sendActions(for: .touchUpInside)
                                }

                                it("displays an alert with the correct error message") {
                                    expect(fakeAlertPresenter.lastAlertController?.message).to(equal(errorMessage.localized))
                                }
                            }
                        }

                        context("and the response contains invalid data") {
                            let errorMessage = "Unable to parse data"
                            
                            beforeEach {
                                fakeURLSession.dataToReturn = HereWeatherResponseDataFixture.InvalidErrorData()
                                viewController.sevenDaysWeatherForecastProvider = HereWeatherProvider(configuration: HereWeatherProviderConfiguration(), urlSession: fakeURLSession)
                                
                                viewController.sendButton.sendActions(for: .touchUpInside)
                            }

                            it("displays an alert with correct error message") {
                                expect(fakeAlertPresenter.lastAlertController?.message).to(equal(errorMessage.localized))
                            }
                        }
                    }
                }
            }
        }
    }
}
