//
//  CustomCell.swift
//  WeatherApp
//
//  Created by Jakob Salomonsson on 2020-02-23.
//  Copyright © 2020 Jakob Salomonsson. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    
    
    func setCell(cityName : String) {
        cityNameLabel.text = cityName
    }
    
}
