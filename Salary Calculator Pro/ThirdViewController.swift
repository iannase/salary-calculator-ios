//
//  ThirdViewController.swift
//  Salary Calculator Pro
//
//  Created by Ian on 2/12/17.
//  Copyright © 2017 IanAnnase. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var millionLabel: UILabel!
    @IBOutlet weak var pennyLabel: UILabel!
    @IBOutlet weak var fiveYearLabel: UILabel!
    @IBOutlet weak var fifteenYearLabel: UILabel!
    @IBOutlet weak var salaryField: UITextField!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func calculate(_ sender: Any) {
        
        if salaryField.text == ""
        {
            salaryField.text = "?"
            return
        }
        
        calcButton.backgroundColor  = UIColor.lightGray
        
        //Million
        let yearlySalary = Double(salaryField.text!)!
        let years = Int(1000000 / yearlySalary)
        let yearsFull = 1000000 / yearlySalary
        let yearsDouble = Double(years)
        let remainder = yearsFull - yearsDouble
        let days = Int(365 * remainder)
        millionLabel.text = "\(years) years and \(days) days"
        
        //Pennies
        let pennyHeight = 0.0598
        let pennyHeightInt = Int(pennyHeight * yearlySalary / 12)
        pennyLabel.text = "\(pennyHeightInt) Feet High"
        
        //2 Percent
        let twoPercent = yearlySalary * 5 * 0.02
        let twoPercentFormatted = NumberFormatter.localizedString(from: NSNumber(value: twoPercent), number: NumberFormatter.Style.currency)
        fiveYearLabel.text = twoPercentFormatted + " in Savings"
        
        //3 Percent
        let threePercent = yearlySalary * 15 * 0.03
        let threePercentFormatted = NumberFormatter.localizedString(from: NSNumber(value: threePercent), number: NumberFormatter.Style.currency)
        fifteenYearLabel.text = threePercentFormatted + " in Savings"
        
        dismissKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        salaryField.delegate = self
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
        scrollView.contentInset = contentInsets;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dismissKeyboard() {
        salaryField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
