//
//  FirstViewController.swift
//  Salary Calculator Pro
//
//  Created by Ian on 2/12/17.
//  Copyright © 2017 IanAnnase. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taxField: UITextField!
    @IBOutlet weak var hourField: UITextField!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var decadeLabel: UILabel!
    @IBOutlet weak var fiftyLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBAction func Calculate(_ sender: Any) {
    }
    
    @IBAction func doneEditing(_ sender: Any) {
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        if hourField.text == ""
        {
            hourField.text = "?"
            return
        }
        
        calcButton.backgroundColor  = UIColor.lightGray
        
        var seconds = 0.0
        var minutes = 0.0
        let hours = Double(hourField.text!)!
        var hours2 = 0.0
        var days = 0.0
        var weeks = 0.0
        var months = 0.0
        var years = 0.0
        var decades = 0.0
        var fifty = 0.0
        
        minutes = hours / 60
        seconds = minutes / 60
        hours2 = hours
        days = hours * 8
        weeks = days * 5
        months = days * 30
        years = days * 365.25
        decades = years * 10
        fifty = years * 50
        
        let weekFormatted = NumberFormatter.localizedString(from: NSNumber(value: weeks), number: NumberFormatter.Style.currency)
        let monthFormatted = NumberFormatter.localizedString(from: NSNumber(value: months), number: NumberFormatter.Style.currency)
        let yearFormatted = NumberFormatter.localizedString(from: NSNumber(value: years), number: NumberFormatter.Style.currency)
        let decadeFormatted = NumberFormatter.localizedString(from: NSNumber(value: decades), number: NumberFormatter.Style.currency)
        let fiftyFormatted = NumberFormatter.localizedString(from: NSNumber(value: fifty), number: NumberFormatter.Style.currency)
        
        secondLabel.text = String(format: "$%.4f Per Second", seconds)
        minuteLabel.text = String(format: "$%.3f Per Minute", minutes)
        hourLabel.text = String(format: "$%.2f Per Hour", hours2)
        dayLabel.text = String(format: "$%.2f Per Day", days)
        weekLabel.text = weekFormatted + " Per Week"
        monthLabel.text = monthFormatted + " Per Month"
        yearLabel.text = yearFormatted + " Per Year"
        decadeLabel.text = decadeFormatted + " Per Decade"
        fiftyLabel.text = fiftyFormatted + " Per 50 Years"
        
        dismissKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourField.delegate = self
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
        scrollView.contentInset = contentInsets;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dismissKeyboard() {
        hourField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

