//
//  ColorManager.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//
import Foundation
import UIKit

class ColorManager {
    static let shared = ColorManager()

    private init() {}

    let white = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    let gray = UIColor(red: 0.65, green: 0.65, blue: 0.68, alpha: 1.0)
    let darkGray = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1.0)
    let black = UIColor(red: 0.01, green: 0.03, blue: 0.02, alpha: 1.0)
    let transparent = UIColor.clear
    let veryLightPink = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
    let lightText = UIColor(red: 0.73, green: 0.73, blue: 0.73, alpha: 1.0)
    let chipText = UIColor(red: 0.57, green: 0.57, blue: 0.57, alpha: 1.0)
    // Diğer renkleri ekleyebilirsiniz...

    func customColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}


