//
//  VCAddItem.swift
//  SecondCoreData
//
//  Created by ihlas on 7.01.2022.
//

import UIKit
import CoreData

class VCAddItem: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet var ivShowImage: UIImageView!
    @IBOutlet var txtItemName: UITextField!
    @IBOutlet var storyPicker: UIPickerView!
    
    var imagePicker:UIImagePickerController!
    
    var listOFStores = [StoreType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStore()
        storyPicker.delegate = self
        storyPicker.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
               
}
    func loadStore(){
        let fetchRequest: NSFetchRequest<StoreType> = StoreType.fetchRequest()
        do{
            listOFStores = try context.fetch(fetchRequest)
        }catch{
            print("cannot load store")
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOFStores.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
            let store = listOFStores[row]
            return store.store_name
    
   
        
    }
    
    
    
    @IBAction func buSelectedPicture(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
          }
          
          func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
              
              if let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
                  ivShowImage.image = image
              }
              imagePicker.dismiss(animated: true, completion: nil)
          }

    
    
    @IBAction func buSave(_ sender: Any) {
        
        
  
        let newItem = Items(context:context)
        newItem.item_name = txtItemName.text
        newItem.date_add = NSDate() as? Date
        newItem.image = ivShowImage.image
        newItem.toStoreType = listOFStores[ StoresPickView.selectedRow(inComponent: 0)]
        do{
            try ad.saveContext()
            txtItemName.text = ""
            
        }catch {
            print("Error cannot save item")
        }
        
    }
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
