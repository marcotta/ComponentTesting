//
//  AlertPresenter.swift
//  weather
//

import UIKit

protocol AlertPresenting {
    func show(alert: UIAlertController, viewController: UIViewController)
}

struct AlertPresenter: AlertPresenting {
    func show(alert: UIAlertController, viewController: UIViewController) {
        viewController.present(alert, animated: true)
    }
}
