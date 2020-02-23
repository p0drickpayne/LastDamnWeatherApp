//
//  SecondViewController.swift
//  WeatherApp
//
//  Created by Jakob Salomonsson on 2020-02-21.
//  Copyright © 2020 Jakob Salomonsson. All rights reserved.
//

import UIKit

struct ReadLocalJson: Codable {
    
    let id : Int?
    let name : String?
    let country : String?
    let coord : Coord?
    
    init(json : [String : Any]) {
        id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        country = json["country"] as? String ?? ""
        coord = json["coord"] as? Coord
    }
}
struct Coord: Codable {
    
    let lon : Double?
    let lat : Double?
    
}
    
    /*[
    {
      "id": 707860,
      "name": "Hurzuf",
      "country": "UA",
      "coord": {
        "lon": 34.283333,
        "lat": 44.549999
      }
    },
    {
      "id": 519188,
      "name": "Novinki",
      "country": "RU",
      "coord": {
        "lon": 37.666668,
        "lat": 55.683334
      }
    },*/
    
    
    
    



class SecondViewController: UIViewController/*,UITableViewDelegate, UITableViewDataSource*/ {
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    
    var myCities : [String] = [""]
    
    var filteredCities : [String] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            
            let URL = Bundle.main.url(forResource: "city.list", withExtension: "json")
            let jsonData = try Data(contentsOf: URL!)
            let states = try JSONDecoder().decode([ReadLocalJson].self, from: jsonData)
            //All data in jsonfile or the struct you know lol
            for singleCity in states {
                let myCityName = singleCity.name
                
                if let unwrapped = myCityName{
                
                myCities.append(unwrapped)
                }
            }
        
        } catch let err {
            print(err)
        }
        
        filteredCities = myCities
        
        Background.gradient(myView: self.view!)
        //myTableView.delegate = self
        //myTableView.dataSource = self
        
        
    }


}
extension SecondViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCities = myCities
        if searchText.isEmpty == false {
            filteredCities = myCities.filter({ $0.contains(searchText)
            })
        }
        myTableView.reloadData()
    }
    
}
/*extension SecondViewController : UITableViewDataSource, UITableViewDelegate {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if (filteredCities.count < 16) {
    return filteredCities.count
    } else {return 16}
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellSearch", for: indexPath)
    
    // Configure the cell’s contents.
    cell.textLabel!.text = filteredCities[indexPath.row]
        
    return cell
}
}*/
