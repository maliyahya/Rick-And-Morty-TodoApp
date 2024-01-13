//
//  UtilityManager.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation

import UIKit

class UtilityManager {
    static let shared = UtilityManager()

    private init() {}

    func dynamicTextSize(fontSize: CGFloat) -> CGFloat {
        let shortestSide = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        
        if shortestSide > 600 {
            return fontSize * 0.55
        } else {
            return fontSize * 0.88
        }
    }

    func dynamicHeight(size: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.height * size
    }

    func dynamicWidth(size: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.width * size
    }

    func dynamicHeightPixel(size: CGFloat) -> CGFloat {
        return size
    }

    func dynamicWidthPixel(size: CGFloat) -> CGFloat {
        let shortestSide = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)

        if shortestSide > 600 {
            return size * 0.55
        } else {
            return size * 0.88
        }
    }

    func isTablet() -> Bool {
        let shortestSide = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        return shortestSide >= 600
    }
}


