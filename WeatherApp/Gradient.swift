//
//  Gradient.swift
//  WeatherApp
//
//  Created by Jakob Salomonsson on 2020-02-21.
//  Copyright © 2020 Jakob Salomonsson. All rights reserved.
//

import Foundation
import UIKit

class Background {
       
       
    static func gradient(myView: UIView) {
           let gradientLayer = CAGradientLayer()
           
        gradientLayer.frame = myView.bounds
           
           gradientLayer.colors = [UIColor.yellow.cgColor,UIColor(named: "ColorOrange")?.cgColor as Any]
           
           myView.layer.insertSublayer(gradientLayer, at: 0)
           
       }
   }

