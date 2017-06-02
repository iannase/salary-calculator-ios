//
//  SecondViewController.swift
//  Salary Calculator Pro
//
//  Created by Ian on 2/12/17.
//  Copyright © 2017 IanAnnase. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var amountToSaveField: UITextField!
    @IBOutlet weak var weeksField: UITextField!
    @IBOutlet weak var savingsLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var paycheck = ["Weekly", "Bi-Weekly", "Monthly", "Semi-Monthly"]
    var choice = "Weekly"
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return paycheck.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return paycheck[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        choice = paycheck[row]

    }
    
    @IBAction func calculate(_ sender: Any) {
        
        if amountToSaveField.text == "" || weeksField.text == ""
        {
            amountToSaveField.text = "?"
            weeksField.text = "?"
            return
        }
        
        calcButton.backgroundColor  = UIColor.lightGray
        
        let amountToSave = Double(amountToSaveField.text!)!
        let weeks = Double(weeksField.text!)!
        var paychecksNumber = 0.0
        var totalPaychecks = 0
        var total = 0.0
        var paychecksDouble = 0.0
        
        if choice == "Weekly" {
            paychecksNumber = 1
        }
        
        if choice == "Bi-Weekly" {
            paychecksNumber = 2
        }
        
        if choice == "Monthly" {
            paychecksNumber = 4.32
        }
        
        if choice == "Semi-Monthly" {
            paychecksNumber = 2.16
        }
        
        totalPaychecks = Int(weeks / paychecksNumber)
        
        paychecksDouble = Double(totalPaychecks)
        total = amountToSave / paychecksDouble
        
        savingsLabel.text = String(format: "$%.2f", total)
        
        dismissKeyboard()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.delegate = self
        pickerView.dataSource = self
        amountToSaveField.delegate = self
        weeksField.delegate = self
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
        scrollView.contentInset = contentInsets;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
    }
    
    func dismissKeyboard() {
        amountToSaveField.resignFirstResponder()
        weeksField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

