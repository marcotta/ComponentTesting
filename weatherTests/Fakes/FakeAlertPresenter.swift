//
//  FakeAlertPresenter.swift
//  weatherTests
//

import UIKit

@testable import weather

class FakeAlertPresenter: AlertPresenting {
    private (set) var lastAlertController: UIAlertController?

    func show(alert: UIAlertController, viewController: UIViewController) {
        lastAlertController = alert
    }
}
