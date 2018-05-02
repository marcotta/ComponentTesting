//
//  ViewControllerFactory.swift
//  weather
//

import UIKit

protocol ViewControllerFactoryProtocol: class {
    func makeInitialViewController() -> UINavigationController
    func makeChooseCityViewController(networkActivityHandler: NetworkActivityHandling,
                                      sevenDaysWeatherForecastProvider: SevenDaysWeatherForecastProvider,
                                      alertPresenter: AlertPresenting,
                                      router: ChooseCityRouting) -> ChooseCityViewController
    func makeSevenDaysForecastsViewController(forecasts: DailyForecasts) -> SevenDaysForecastsViewController
    func makeSevenDaysForecastsViewController(dataSource: SevenDaysForecastsDataSourceType) -> SevenDaysForecastsViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {

    func makeInitialViewController() -> UINavigationController {
        let chooseCityViewController: ChooseCityViewController = UIStoryboard(.main).instantiateViewController()
        let navigationController = UINavigationController(rootViewController: chooseCityViewController)
        chooseCityViewController.router = ChooseCityRouter(navigationController: chooseCityViewController.navigationController, viewControllerFactory: self)

        return navigationController
    }

    func makeChooseCityViewController(networkActivityHandler: NetworkActivityHandling,
                                      sevenDaysWeatherForecastProvider: SevenDaysWeatherForecastProvider,
                                      alertPresenter: AlertPresenting,
                                      router: ChooseCityRouting) -> ChooseCityViewController {
        let chooseCityViewController: ChooseCityViewController = UIStoryboard(.main).instantiateViewController()
        chooseCityViewController.networkActivityHandler = networkActivityHandler
        chooseCityViewController.sevenDaysWeatherForecastProvider = sevenDaysWeatherForecastProvider
        chooseCityViewController.alertPresenter = alertPresenter
        chooseCityViewController.router = router

        return chooseCityViewController
    }

    func makeSevenDaysForecastsViewController(forecasts: DailyForecasts) -> SevenDaysForecastsViewController {
        return makeSevenDaysForecastsViewController(dataSource: SevenDaysForecastsDataSource(forecasts: forecasts))
    }

    func makeSevenDaysForecastsViewController(dataSource: SevenDaysForecastsDataSourceType) -> SevenDaysForecastsViewController {
        let sevenDaysForecastsViewController: SevenDaysForecastsViewController = UIStoryboard(.main).instantiateViewController()
        sevenDaysForecastsViewController.dataSource = dataSource

        return sevenDaysForecastsViewController
    }
}
