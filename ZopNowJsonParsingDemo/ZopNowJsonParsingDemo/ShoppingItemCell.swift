//
//  ShoppingItemCell.swift
//  ZopNowJsonParsingDemo
//
//  Created by Bhushan Udawant on 30/10/18.
//  Copyright © 2018 Bhushan Udawant. All rights reserved.
//

import UIKit

class ShoppingItemCell: UITableViewCell {

    // MARK: IBOutlets

    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var productName: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
