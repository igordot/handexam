//
//  MedicalHistoryViewController.swift
//

import UIKit

class MedicalHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // connect to the storyboard
    @IBOutlet weak var tableView: UITableView!
    
    // data for the table view cells
    let tableContents: [String] = ["Previous Hand Trauma",
                                   "Previous Hand Surgery",
                                   "Osteoarthritis",
                                   "Rheumatoid Arthritis",
                                   "Diabetes",
                                   "Coronary Artery Disease",
                                   "COPD",
                                   "Chronic Kidney Disease",
                                   "Cirrhosis",
                                   "Lymph Adema",
                                   "HIV",
                                   "Immunocompromised",
                                   "Peripheral Vascular Disease"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register the table view cell class and its reuse id (custom cell from nib)
        let nib = UINib(nibName: "CellWithTextInput", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CellWithTextInputIdentifier")
        
        // provide the delegate methods and row data for the table view
        tableView.delegate = self
        tableView.dataSource = self
        
        // add empty footer (prevents creation of empty rows)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    // set number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableContents.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one (custom cell from nib)
        let cell:CellWithTextInput = tableView.dequeueReusableCell(withIdentifier: "CellWithTextInputIdentifier") as! CellWithTextInput
        
        // set the text from the data model (custom cell)
        cell.labelLeft.text = tableContents[indexPath.row]
        
        return cell
    }
}
