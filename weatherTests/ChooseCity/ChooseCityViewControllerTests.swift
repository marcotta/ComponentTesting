//
//  ChooseCityViewControllerTests.swift
//  weather
//

import Quick
import Nimble

@testable import weather

class ChooseCityViewControllerTests: QuickSpec {
    override func spec() {
        describe("ChooseCityViewController Tests") {
            var fakeChooseCityRouter: FakeChooseCityRouter!
            var fakeNetworkActivityHandler: FakeNetworkActivityHandler!
            var fakeSevenDaysWeatherForecastProvider: FakeSevenDaysWeatherForecastProvider!
            var fakeAlertPresenter: FakeAlertPresenter!
            
            var viewController: ChooseCityViewController!
            
            beforeSuite {
                fakeNetworkActivityHandler = FakeNetworkActivityHandler()
                fakeSevenDaysWeatherForecastProvider = FakeSevenDaysWeatherForecastProvider()
                fakeAlertPresenter = FakeAlertPresenter()
                fakeChooseCityRouter = FakeChooseCityRouter()
                viewController = ViewControllerFactory().makeChooseCityViewController(networkActivityHandler: fakeNetworkActivityHandler,
                                                                                      sevenDaysWeatherForecastProvider: fakeSevenDaysWeatherForecastProvider,
                                                                                      alertPresenter: fakeAlertPresenter,
                                                                                      router: fakeChooseCityRouter)
                
                _ = viewController.view
            }
            
            describe("ChooseCityViewController.viewDidLoad()") {
                it("has a network activity handler") {
                    expect(viewController.networkActivityHandler).notTo(beNil())
                }
                
                it("has a data provider") {
                    expect(viewController.sevenDaysWeatherForecastProvider).notTo(beNil())
                }
                
                it("has an alert presenter") {
                    expect(viewController.alertPresenter).notTo(beNil())
                }
                
                it("has a router") {
                    expect(viewController.router).notTo(beNil())
                }
                
                it("has a city text field") {
                    expect(viewController.cityTextField).notTo(beNil())
                }
                
                it("has a city text field with the correct placeholder") {
                    expect(viewController.cityTextField.placeholder).to(equal("Type a city".localized))
                }
                
                it("has a button to request weather info for the new city") {
                    expect(viewController.sendButton).notTo(beNil())
                }
            }
            
            describe("ChooseCityViewController.sendButtonTapped(_:)") {
                context("when city text field has a value") {
                    let city = "Berlin"
                    
                    beforeEach {
                        viewController.cityTextField.text = city
                    }
                    
                    context("and in all cases") {
                        beforeEach {
                            fakeNetworkActivityHandler = FakeNetworkActivityHandler()
                            viewController.networkActivityHandler = fakeNetworkActivityHandler
                            
                            fakeSevenDaysWeatherForecastProvider = FakeSevenDaysWeatherForecastProvider()
                            viewController.sevenDaysWeatherForecastProvider = fakeSevenDaysWeatherForecastProvider
                            
                            viewController.sendButtonTapped(viewController.sendButton)
                        }
                        
                        it("shows the network activity indicator") {
                            expect(fakeNetworkActivityHandler.status.first).to(beTruthy())
                        }
                        
                        it("tries to load weather forecasts") {
                            expect(fakeSevenDaysWeatherForecastProvider.findForecastAttempted).to(beTruthy())
                        }
                        
                        it("tries to load weather forecasts for the correct city") {
                            expect(fakeSevenDaysWeatherForecastProvider.city).to(equal(city))
                        }
                    }
                    
                    context("and it receives valid data") {
                        let dailyForecasts = DailyFoorecastsFixture.DailyForecastsItem()
                        
                        beforeEach {
                            fakeChooseCityRouter = FakeChooseCityRouter()
                            viewController.router = fakeChooseCityRouter
                            
                            fakeNetworkActivityHandler = FakeNetworkActivityHandler()
                            viewController.networkActivityHandler = fakeNetworkActivityHandler
                            
                            fakeSevenDaysWeatherForecastProvider = FakeSevenDaysWeatherForecastProvider()
                            fakeSevenDaysWeatherForecastProvider.dailyForecastsToReturn = dailyForecasts
                            viewController.sevenDaysWeatherForecastProvider = fakeSevenDaysWeatherForecastProvider
                            
                            viewController.sendButtonTapped(viewController.sendButton)
                        }
                        
                        it("shows forecast screen with the correct data") {
                            expect(fakeChooseCityRouter.lastShownForecasts).to(equal(dailyForecasts))
                        }
                        
                        it("hides the network activity indicator") {
                            expect(fakeNetworkActivityHandler.status.last).to(beFalse())
                        }
                    }
                    
                    context("and it receives an error") {
                        let errorMessage = "Test error"
                        let title = "Problem"
                        
                        beforeEach {
                            fakeAlertPresenter = FakeAlertPresenter()
                            viewController.alertPresenter = fakeAlertPresenter
                            
                            fakeNetworkActivityHandler = FakeNetworkActivityHandler()
                            viewController.networkActivityHandler = fakeNetworkActivityHandler
                            
                            fakeSevenDaysWeatherForecastProvider = FakeSevenDaysWeatherForecastProvider()
                            fakeSevenDaysWeatherForecastProvider.errorToReturn = CustomError(errorMessage)
                            viewController.sevenDaysWeatherForecastProvider = fakeSevenDaysWeatherForecastProvider
                            
                            viewController.sendButtonTapped(viewController.sendButton)
                        }
                        
                        it("displays an alert with the correct title") {
                            expect(fakeAlertPresenter.lastAlertController?.title).to(equal(title.localized))
                        }
                        
                        it("displays an alert with the correct error message") {
                            expect(fakeAlertPresenter.lastAlertController?.message).to(equal(errorMessage.localized))
                        }
                        
                        it("displays an alert with the ok button") {
                            expect(fakeAlertPresenter.lastAlertController?.actions.contains { $0.title == "Ok".localized }).to(beTruthy())
                        }
                        
                        it("hides the network activity indicator") {
                            expect(fakeNetworkActivityHandler.status.last).to(beFalse())
                        }
                    }
                }
                
                context("when city text field does not have a value") {
                    beforeEach {
                        viewController.cityTextField.text = ""
                        
                        fakeNetworkActivityHandler = FakeNetworkActivityHandler()
                        viewController.networkActivityHandler = fakeNetworkActivityHandler
                        
                        fakeSevenDaysWeatherForecastProvider = FakeSevenDaysWeatherForecastProvider()
                        viewController.sevenDaysWeatherForecastProvider = fakeSevenDaysWeatherForecastProvider
                        
                        viewController.sendButtonTapped(viewController.sendButton)
                    }
                    
                    it("does not show a network activity indicator") {
                        expect(fakeNetworkActivityHandler.status.count).to(equal(0))
                    }
                    
                    it("does not try to load weather forecasts") {
                        expect(fakeSevenDaysWeatherForecastProvider.findForecastAttempted).to(beFalse())
                    }
                }
            }
        }
    }
}
