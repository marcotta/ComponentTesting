//
//  FakeViewControllerFactory.swift
//  weatherTests
//

import UIKit

@testable import weather

class FakeViewControllerFactory: ViewControllerFactoryProtocol {
    public private (set) var lastSevenDaysForecastsShown: DailyForecasts?
    public private (set) var lastSevenDaysForecastsDataSource: SevenDaysForecastsDataSourceType?

    func makeInitialViewController() -> UINavigationController {
        return UINavigationController()
    }

    func makeChooseCityViewController(networkActivityHandler: NetworkActivityHandling,
                                      sevenDaysWeatherForecastProvider: SevenDaysWeatherForecastProvider,
                                      alertPresenter: AlertPresenting,
                                      router: ChooseCityRouting) -> ChooseCityViewController {
        return ChooseCityViewController()
    }

    func makeSevenDaysForecastsViewController(forecasts: DailyForecasts) -> SevenDaysForecastsViewController {
        lastSevenDaysForecastsShown = forecasts
        return SevenDaysForecastsViewController()
    }

    func makeSevenDaysForecastsViewController(dataSource: SevenDaysForecastsDataSourceType) -> SevenDaysForecastsViewController {
        lastSevenDaysForecastsDataSource = dataSource
        return SevenDaysForecastsViewController()
    }
}
