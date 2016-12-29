//
//  CellWithTextInput.swift
//

import UIKit

class CellWithTextInput: UITableViewCell {

    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var rightTextInput: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
