//
//  SecondViewController.swift
//  MVCDesignPatternDemo
//
//  Created by Mac on 04/01/17.
//

import UIKit

class SecondViewController: UIViewController {
    
 
    @IBOutlet weak var EmployeeiDTextField: UITextField!
    
    @IBOutlet weak var EmployeeFirstNameTextField: UITextField!
    
    @IBOutlet weak var EmployeeLastNameTextField: UITextField!
    
    @IBOutlet weak var EmployeeSalaryTextField: UITextField!
    
    var delegateOnSecondviewController : BackDataPasssingProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickBtnToAddEmployeeRecord(_ sender: Any) {
        guard let delegate = delegateOnSecondviewController else {
            print("Delegate Not Created")
            return
        }
        let id = self.EmployeeiDTextField.text
        let idInt = Int(id!) ?? 0
        let empFirstName = self.EmployeeFirstNameTextField.text ?? "Default FN"
        let empLastName = self.EmployeeLastNameTextField.text ?? "Default LN"
        let empSalary = self.EmployeeSalaryTextField.text
        let empSalaryFloat = Float(empSalary!) ?? 0.0
        
        delegate.passingDataToFirstViewController(employee: Employee(empId: idInt,
                                                                     empFirstName: empFirstName,
                                                                     empLastName: empLastName,
                                                                     empSalary: empSalaryFloat))
        
                                                  navigationController?.popViewController(animated: true)

    }
        

}
    
   
