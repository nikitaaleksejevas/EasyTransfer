//
//  TransferTableViewCell.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-30.
//

import UIKit

class TransferTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var receiverLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
