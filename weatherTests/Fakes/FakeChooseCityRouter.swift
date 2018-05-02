//
//  FakeChooseCityRouter.swift
//  weatherTests
//

@testable import weather

class FakeChooseCityRouter: ChooseCityRouting {
    var viewControllerFactory: ViewControllerFactoryProtocol?
    var navigationController: UINavigationControllerProtocol?
    private (set) var lastShownForecasts: DailyForecasts?

    func showSevenDaysForecasts(forecasts: DailyForecasts) {
        lastShownForecasts = forecasts
    }
}
