//
//  ViewController.swift
//  Registration-Form using PHP(POST)
//
//  Created by iFlame. on 03/08/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let url = "http://219.91.129.92/SimplifiediOS/v1/register.php"
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var phoneno: UITextField!
    
    @IBOutlet weak var massage: UILabel!
    
    
    @IBAction func register(_ sender: UIButton) {
        let parameters : Parameters = [
            "username":username.text!,
            "password":password.text!,
            "name": name.text!,
            "email": email.text!,
            "phone": phoneno.text!
            
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
            
            response in
            //printing response
            print(response)
            
            //getting the json value from the server
            if let result = response.result.value {
                
                //converting it as NSDictionary
                let jsonData = result as! NSDictionary
                
                //displaying the message in label
                self.massage.text = jsonData.value(forKey: "message") as! String?
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

