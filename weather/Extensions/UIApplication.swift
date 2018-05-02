//
//  UIApplication.swift
//  weather
//

import UIKit

protocol NetworkActivityHandling {
    var isNetworkActivityIndicatorVisible: Bool { get set }
}

extension UIApplication: NetworkActivityHandling { }
