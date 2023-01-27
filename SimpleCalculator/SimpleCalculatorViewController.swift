//
//  SimpleCalculatorViewController.swift
//  SimpleCalculator
//
//  Created by Rania Arbash on 2023-01-27.
//

import UIKit


class SimpleCalculatorViewController: UIViewController {

    var myCalculatorBrain =  CalculatorBrain()
    
    @IBOutlet weak var num1Text: UITextField!
    
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var num2Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load")
        num1Text.keyboardType = .numberPad
        num2Text.keyboardType = .numberPad
        
        
        var myString : String? = "Hello"
       
        if let goodString = myString{
            print(goodString)
        }
     
        
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("View Will Appear")

    }
    
    // MVC
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        
        if validateUserInput(){
            if let num1 = num1Text.text {
                if let num2 = num2Text.text {
                        let intNum1 = Int(num1)
                        let intNum2 = Int(num2)
                
                if let op = sender.titleLabel?.text{
                    
                let result =  myCalculatorBrain.doMath(num1: intNum1!, num2: intNum2!, op: op)
                
                resultText.text = "\(intNum1!) \(op) \(intNum2!) = \(result)"
                }
                }
                
                }
        }
        }
        
    func showAlert(message : String){
        let alert =   UIAlertController(title: message, message: "Please Enter Two Numbers", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel)

        alert.addAction(action)
        
        present(alert, animated: false)
    }
    
    
    func validateUserInput() -> Bool{
        var flag = false;
        if let num1 = num1Text.text {
            if let num2 = num2Text.text {
                if !num1.isEmpty && !num2.isEmpty{
                    if num1.isNumber && num2.isNumber{
                        flag = true
                    }else {
                        showAlert(message: "One or More input is not Number")
                    }
                }else {
                    showAlert(message: "Missing Numbers")
                }
            }
        }
        return flag
    }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



extension String{
    var isNumber: Bool {
            let digitsCharacters = CharacterSet(charactersIn: "0123456789")
            return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
        }
}
