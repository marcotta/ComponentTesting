//
//  UIUtility.swift
//  weather
//

import Foundation

struct UIUtility {

    //avoid async dispatch when already on the main thread
    public static func performOnMainThread(using closure: @escaping () -> Void) {
        Thread.isMainThread ? closure() : DispatchQueue.main.async(execute: closure)
    }
}
