//
//  ViewController.swift
//  MVCDesignPatternDemo
//
//  Created by Mac on 04/01/17.
// MVC Design pattern

import UIKit

class ViewController: UIViewController{

    var employees : [Employee] = []
    
var secondViewController : SecondViewController = SecondViewController()
    
    @IBOutlet weak var TableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.delegate = self
        
        
        let uiNib = UINib(nibName: "EmployeeTableViewCell", bundle: nil)
        self.TableView.register(uiNib, forCellReuseIdentifier: "EmployeeTableViewCell")
    }

    
    @IBAction func addNewEmployee(_ sender: Any) {
    secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    secondViewController.delegateOnSecondviewController = self
    navigationController?.pushViewController(secondViewController, animated: true)
}

}

extension ViewController :UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeTableViewCell = self.TableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
        
        let eachEmployee = employees[indexPath.row]
        employeeTableViewCell.empIDLabel.text = String(eachEmployee.empId)
        employeeTableViewCell.empFirstNameLabel.text = eachEmployee.empFirstName
        employeeTableViewCell.empLastNameLabel.text = eachEmployee.empLastName
        employeeTableViewCell.empSalaryLabel.text = String(eachEmployee.empSalary)
        
         return employeeTableViewCell
    }
    
}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
  
}
extension ViewController : BackDataPasssingProtocol{
    func passingDataToFirstViewController(employee: Employee) {
        let employeeObject = Employee(empId: employee.empId,
                                      empFirstName: employee.empFirstName,
                                      empLastName: employee.empLastName,
                                      empSalary: employee.empSalary)

}
}

    
    














