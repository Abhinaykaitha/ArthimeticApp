//
//  ViewController.swift
//  ArthimeticApp
//
//  Created by Student on 2/14/19.
//  Copyright © 2019 AbhinayKaitha. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var selectedActivity:String? = "Select Activity"
    let activity = ["Select Activity","Bicycling","Jumping rope","Running - slow","Running - fast","Tennis","Swimming"]
    @IBOutlet weak var WeightTF: UITextField!
    
    @IBOutlet weak var ActivityPV: UIPickerView!
    
    @IBOutlet weak var ExerciseTF: UITextField!
    
    @IBOutlet weak var EnergyConsumedLB: UILabel!
    @IBOutlet weak var LoseOnePoundLB: UILabel!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activity[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activity.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedActivity = activity[row]
    }
    
    @IBAction func calculate(_ sender: Any) {
        let weight = Double(WeightTF.text!)
        let excercise = Double(ExerciseTF.text!)
        
        if weight == nil || excercise == nil || selectedActivity == "Select Activity"{
            
        }else{
            let energyConsumed = ExerciseCoach.energyConsumed(during: selectedActivity!, weight: weight!, time: excercise!)
            let timeToLose1Pound = ExerciseCoach.timeToLose1Pound(during:selectedActivity!,weight:weight!)
            EnergyConsumedLB.text = "\(energyConsumed) cal"
            LoseOnePoundLB.text = "\(timeToLose1Pound) minutes"
        }//end of if-else case
        
    }
    
    @IBAction func clear(_ sender: Any) {
        selectedActivity = "Select Activity"
        WeightTF.text = ""
        ExerciseTF.text = ""
        EnergyConsumedLB.text = "0 cal"
        LoseOnePoundLB.text = "0 minutes"
        ActivityPV.selectRow(0, inComponent: 0, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

