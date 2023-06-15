//
//  ViewController.swift
//  ComplicatedCounter
//
//  Created by Анастасия on 13.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterText: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var subtractButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func addButtonDidTap(_ sender: Any) {
        text = "значение изменено на: +1"
        counter += 1
    }
    
    @IBAction func subtractButtonDidTap(_ sender: Any) {
        if counter == 0 {
            text = "попытка уменьшить значение счётчика ниже 0"
            counter = 0
        } else if counter > 0 {
            text = "значение изменено на: -1"
            counter -= 1
        }
    }
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        text = "значение сброшено"
        counter = 0
    }
    
    var counter: Int = 0 {
        didSet {
            updateCounterText()
            updateHistory(text: "\(timeCheck()) \(text)")
        }
    }
    
    private func updateCounterText() {
        counterText.text = "\(counter)"
    }
    
    private func timeCheck() -> String {
        let currentDateTime = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM h:mm"
        
        let dateTimeString = formatter.string(from: currentDateTime)
        return dateTimeString
        
    }
    
    var text: String = ""
    
    private func updateHistory(text: String) {
        historyTextView.text = historyTextView.text + "\n" + text
    }
    
    
}




