//
//  ViewControllerFactoryTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class ViewControllerFactoryTests: QuickSpec {
    override func spec() {
        describe("ViewControllerFactory Tests") {
            var factory: ViewControllerFactory?
            
            describe("init") {
                beforeEach {
                    factory = ViewControllerFactory()
                }
                
                it("initializes correctly") {
                    expect(factory).toNot(beNil())
                }
                
                it("conforms to protocol") {
                    expect(factory).to(beAKindOf(ViewControllerFactoryProtocol.self))
                }
            }
            
            describe("ViewControllerFactoryProtocol.makeInitialViewController()") {
                var navigationController: UINavigationController?
                var chooseCityViewController: ChooseCityViewController?
                
                beforeEach {
                    factory = ViewControllerFactory()
                    navigationController = factory?.makeInitialViewController()
                    chooseCityViewController = navigationController?.visibleViewController as? ChooseCityViewController
                }
                
                it("creates a navigation controller") {
                    expect(navigationController).toNot(beNil())
                }
                
                it("has a ChooseCity viewcontroller") {
                    expect(chooseCityViewController).toNot(beNil())
                }
                
                it("has the default data provider") {
                    expect(chooseCityViewController?.sevenDaysWeatherForecastProvider).toNot(beNil())
                }
                
                it("has the default netwrokActivityHandler") {
                    expect(chooseCityViewController?.networkActivityHandler).toNot(beNil())
                }
                
                it("has the default alertPresenter") {
                    expect(chooseCityViewController?.alertPresenter).toNot(beNil())
                }
                
                it("has the default router") {
                    expect(chooseCityViewController?.router).toNot(beNil())
                }
                
                it("has the default router with the correct navigationController") {
                    expect(chooseCityViewController?.router?.navigationController).to(beIdenticalTo(navigationController))
                }
                
                it("has the default router with the correct factory") {
                    expect(chooseCityViewController?.router?.viewControllerFactory).to(beIdenticalTo(factory))
                }
            }
            
            describe("ViewControllerFactoryProtocol.makeChooseCityViewController(networkActivityHandler:sevenDaysWeatherForecastProvider:alertPresenter:router:)") {
                var chooseCityViewController: ChooseCityViewController?
                let fakeNetworkActivityHandler = FakeNetworkActivityHandler()
                let fakeSevenDaysWeatherForecastProvider = FakeSevenDaysWeatherForecastProvider()
                let fakeAlertPresenter = FakeAlertPresenter()
                let fakeChooseCityRouter = FakeChooseCityRouter()
                
                beforeEach {
                    chooseCityViewController = factory?.makeChooseCityViewController(networkActivityHandler: fakeNetworkActivityHandler,
                                                                                     sevenDaysWeatherForecastProvider: fakeSevenDaysWeatherForecastProvider,
                                                                                     alertPresenter: fakeAlertPresenter,
                                                                                     router: fakeChooseCityRouter)
                }
                
                it("initializes a ChooseCity viewcontroller") {
                    expect(chooseCityViewController).toNot(beNil())
                }
                
                it("has the correct provider") {
                    expect(chooseCityViewController?.sevenDaysWeatherForecastProvider).to(beIdenticalTo(fakeSevenDaysWeatherForecastProvider))
                }
                
                it("has the correct netwrokActivityHandler") {
                    expect(chooseCityViewController?.networkActivityHandler).to(beIdenticalTo(fakeNetworkActivityHandler))
                }
                
                it("has the correct alertPresenter") {
                    expect(chooseCityViewController?.alertPresenter).to(beIdenticalTo(fakeAlertPresenter))
                }
                
                it("has no router") {
                    expect(chooseCityViewController?.router).to(beIdenticalTo(fakeChooseCityRouter))
                }
            }
            
            describe("ViewControllerFactoryProtocol.makeSevenDaysForecastsViewController(forecasts:)") {
                var sevenDaysForecastsViewController: SevenDaysForecastsViewController?
                let dailyForecasts = DailyFoorecastsFixture.DailyForecastsItem()
                
                beforeEach {
                    sevenDaysForecastsViewController = factory?.makeSevenDaysForecastsViewController(forecasts: dailyForecasts)
                }
                
                it("initializes a SevenDaysForecasts ViewController") {
                    expect(sevenDaysForecastsViewController).toNot(beNil())
                }
                
                it("initializes a SevenDaysForecasts ViewController with a datasource") {
                    expect(sevenDaysForecastsViewController?.dataSource).toNot(beNil())
                }
                
                it("initializes a SevenDaysForecasts ViewController with a datasource containing the correct forecasts") {
                    expect(sevenDaysForecastsViewController?.dataSource?.forecasts).to(equal(dailyForecasts))
                }
            }
            
            describe("ViewControllerFactoryProtocol.makeSevenDaysForecastsViewController(datasource:)") {
                var sevenDaysForecastsViewController: SevenDaysForecastsViewController?
                let dailyForecasts = DailyFoorecastsFixture.DailyForecastsItem()
                let dataSource = SevenDaysForecastsDataSource(forecasts: dailyForecasts)
                
                beforeEach {
                    sevenDaysForecastsViewController = factory?.makeSevenDaysForecastsViewController(dataSource: dataSource)
                }
                
                it("initializes a SevenDaysForecasts ViewController") {
                    expect(sevenDaysForecastsViewController).toNot(beNil())
                }
                
                it("initializes a SevenDaysForecasts ViewController with a datasource") {
                    expect(sevenDaysForecastsViewController?.dataSource).to(beIdenticalTo(dataSource))
                }
                
                it("initializes a SevenDaysForecasts ViewController with a datasource containing the correct forecasts") {
                    expect(sevenDaysForecastsViewController?.dataSource?.forecasts).to(equal(dailyForecasts))
                }
            }
        }
    }
}
