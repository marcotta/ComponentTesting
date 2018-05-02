//
//  ChooseCityViewController.swift
//  weather
//

import UIKit

class ChooseCityViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    lazy var networkActivityHandler: NetworkActivityHandling = UIApplication.shared
    lazy var sevenDaysWeatherForecastProvider: SevenDaysWeatherForecastProvider = HereWeatherProvider()
    var alertPresenter: AlertPresenting = AlertPresenter()
    var router: ChooseCityRouting?

    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.placeholder = "Type a city".localized
    }

    @IBAction func sendButtonTapped(_ sender: UIButton) {

        guard let city = cityTextField.text, !city.isEmpty else {
            return
        }

        networkActivityHandler.isNetworkActivityIndicatorVisible = true
        sevenDaysWeatherForecastProvider.findForecast(with: city,
                                                      completion: { [weak self] (forecasts, error)  in

                                                        UIUtility.performOnMainThread {
                                                            self?.networkActivityHandler.isNetworkActivityIndicatorVisible = false

                                                            if error != nil {
                                                                let alert = self?.makeOkAlert(with: error!.localizedDescription)
                                                                self?.alertPresenter.show(alert: alert!, viewController: self!)
                                                                return
                                                            }

                                                            guard let forecasts = forecasts else {
                                                                let alert = self?.makeOkAlert(with: "No data")
                                                                self?.alertPresenter.show(alert: alert!, viewController: self!)
                                                                return
                                                            }

                                                            self?.router?.showSevenDaysForecasts(forecasts: forecasts)
                                                        }
        })
    }

    private func makeOkAlert(with message: String) -> UIAlertController {
        let title = "Problem".localized
        let message = message.localized
        let actionText = "Ok".localized

        return UIAlertController.makeOneButtonAlertController(with: title, message: message, actionText: actionText)
    }
}
