//
//  UIStoryboard.swift
//  weather
//

import UIKit

extension UIStoryboard {
    enum StoryboardType: String {
        case main = "Main"
    }

    convenience init(_ storyboardType: StoryboardType) {
        self.init(name: storyboardType.rawValue, bundle: nil)
    }

    func instantiateViewController<T: UIViewController>() -> T {
        let identifier = String(describing: T.self)
        guard let viewController = self.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("View controller with identifier \(identifier) not found")
        }

        return viewController
    }
}
