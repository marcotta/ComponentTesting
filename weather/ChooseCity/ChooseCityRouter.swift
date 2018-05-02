//
//  ChooseCityRouter.swift
//  weather
//

import UIKit

protocol ChooseCityRouting {
    var navigationController: UINavigationControllerProtocol? { get }
    var viewControllerFactory: ViewControllerFactoryProtocol? { get }

    func showSevenDaysForecasts(forecasts: DailyForecasts)
}

class ChooseCityRouter: ChooseCityRouting {
    public private (set) weak var navigationController: UINavigationControllerProtocol?
    public private (set) var viewControllerFactory: ViewControllerFactoryProtocol?

    init(navigationController: UINavigationControllerProtocol?, viewControllerFactory: ViewControllerFactoryProtocol?) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }

    func showSevenDaysForecasts(forecasts: DailyForecasts) {
        let sevenDaysForecastsViewController = viewControllerFactory?.makeSevenDaysForecastsViewController(forecasts: forecasts)
        navigationController?.pushViewController(sevenDaysForecastsViewController!, animated: true)
    }
}
