//
//  RecordTableViewCell.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 7/4/2021.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
