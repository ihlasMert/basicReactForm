//
//  ViewController.swift
//  SecondCoreData
//
//  Created by ihlas on 7.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtStoreName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buAddStore(_ sender: Any) {
        
        let newStore = StoreType(context: context)
        newStore.store_name = txtStoreName.text
        do{
            try ad.saveContext()
            txtStoreName.text = ""
        }catch{
            print("connot save record")
        }
    }
    
    
    @IBAction func buBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}

