//
//  SearchListTableViewCell.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 30/3/2021.
//

import UIKit

class SearchListTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func uiBind(product: Product){
        productNameLabel.text = product.productName
    }


}
