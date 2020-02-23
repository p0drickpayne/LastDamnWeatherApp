//
//  FirstViewController.swift
//  WeatherApp
//
//  Created by Jakob Salomonsson on 2020-02-21.
//  Copyright © 2020 Jakob Salomonsson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // let myVC = HomeViewController.self
        Background.gradient(myView: self.view!)
        currentTemprature()
        
        
        
        //self.navigationController!.toolbar.barTintColor = UIColor(named: "ColorOrange")
        
        
    }
    
   
    
    
    
    //@IBAction func homeTapped(_ sender: Any) {
    func currentTemprature (){
               print("Get joke button pressed")
               let weather = WeatherAPI()
               weather.getCurrWeather { (result) in
                   switch result {
                   case .success(let myWeather):
                    print("Value: " + (String)(myWeather.main.temp))
                       DispatchQueue.main.async {
                           // Uppdatera UI
                        self.showTemp.text = "Temprature = \(myWeather.main.temp)"
                       }
                   case .failure(let error): print("Error \(error)")
                   }
               }
           
    }
    @IBOutlet weak var showTemp: UILabel!
    
    
    


}

