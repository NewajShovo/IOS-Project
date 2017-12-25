//
//  HomeViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

struct shuvo: Decodable {
    let name: String
   
    let clubs: [club]
    
}



struct club: Decodable{
    let key : String
    let name: String
    let code: String
    ///let imageUrl : String
}




class HomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        let jsonURLString = "https://raw.githubusercontent.com/opendatajson/football.json/master/2015-16/en.1.clubs.json"
        guard let url = URL(string: jsonURLString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, responce, err) in
            guard let data = data else {return}
            let dataAsString = String(data: data, encoding: .utf8)
            //print(dataAsString)
            do{
                let value =  try JSONDecoder().decode(shuvo.self, from: data)
                
                 print(value)
            }catch let jsonErr{
                print("Error:",jsonErr)
            }
            }.resume()
        
        print("You are close")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
        
        
        
        
        // Do any additional setup after loading the view.
    }


    
    
    
    
}


