//
//  InjuryHistoryViewController.swift
//

import UIKit

class InjuryHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // connect to the storyboard
    @IBOutlet weak var tableView: UITableView!
    
    // data for the table view cells
    let tableContents: [String] = ["Hours Since Injury",
                                   "Transfer from Outside Hospital",
                                   "Mechanism (Blunt, Sharp, etc)",
                                   "Soft Tissue",
                                   "Tendon",
                                   "Nerve",
                                   "Vascular",
                                   "Skeletal",
                                   "Nail Bed",
                                   "Cellulitis/Abscess",
                                   "Foreign Body",
                                   "Digit/Hand Threatened",
                                   "Replant Candidate",
                                   "X-Rays Taken"]
    
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
