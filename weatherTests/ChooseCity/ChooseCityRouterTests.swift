//
//  ChooseCityRouterTests.swift
//  weather
//

import Quick
import Nimble

@testable import weather

class ChooseCityRouterTests: QuickSpec {
    override func spec() {

        describe("ChooseCityRouterTests Tests") {
            var chooseCityRouter: ChooseCityRouter!
            let fakeNavigationController = FakeNavigationController()
            let fakeViewControllerFactory = FakeViewControllerFactory()

            beforeSuite {
                chooseCityRouter = ChooseCityRouter(navigationController: fakeNavigationController,
                                                    viewControllerFactory: fakeViewControllerFactory)
            }

            describe("ChooseCityRouter.init(navigationController:)") {
                it("correctly initializes a navigationController") {
                    expect(chooseCityRouter.navigationController).toNot(beNil())
                }

                it("correctly initializes a viewController factory") {
                    expect(chooseCityRouter.viewControllerFactory).toNot(beNil())
                }

                it("conforms to ChooseCityRouting protocol") {
                    expect(chooseCityRouter).to(beAKindOf(ChooseCityRouting.self))
                }
            }

            describe("ChooseCityRouting.showSevenDaysForecasts(forecasts:)") {
                let dailyForecasts = DailyFoorecastsFixture.DailyForecastsItem()

                beforeEach {
                    chooseCityRouter.showSevenDaysForecasts(forecasts: dailyForecasts)
                }

                it("shows the SevenDaysForecasts view controller") {
                    expect(fakeNavigationController.lastPushedViewController).to(beAKindOf(SevenDaysForecastsViewController.self))
                }

                it("displays the correct data") {
                    expect(fakeViewControllerFactory.lastSevenDaysForecastsShown).to(equal(dailyForecasts))
                }
            }
        }
    }
}
