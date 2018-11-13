//
//  ShoppingItemDetailsViewController.swift
//  ZopNowJsonParsingDemo
//
//  Created by Bhushan Udawant on 14/11/18.
//  Copyright © 2018 Bhushan Udawant. All rights reserved.
//

import UIKit

class ShoppingItemDetailsViewController: UIViewController {
    
    // MARK: Constants
    
    var shoppingItemDetailsModel: ShoppingListModel?
    
    // MARK: IBOutlets
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var fullProductName: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var discount: UILabel!
    
    // MARK: Life cycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let shoppingItemDetailsModel = shoppingItemDetailsModel else {
            return
        }

        self.title = shoppingItemDetailsModel.productName

        fullProductName.text = shoppingItemDetailsModel.variants.first?.variantFullName
        let mrp = String(format: "%d", (shoppingItemDetailsModel.variants.first?.mrp)!)
        rate.text = mrp + (shoppingItemDetailsModel.variants.first?.currency)!
        let discountedAmount = String(format: "%lf", (shoppingItemDetailsModel.variants.first?.discount)!)
        discount.text = discountedAmount

        // Download and display product image
        downloadImage()
    }

    // MARK: Helper

    func downloadImage() {
        guard let shoppingItemDetailsModel = shoppingItemDetailsModel else {
            return
        }

        let urlString = "https:" + shoppingItemDetailsModel.imageUrl

        guard let url = URL(string: urlString),
            let data = try? Data(contentsOf: url) else {
            return
        }

        DispatchQueue.main.async {
            self.productImage.image = UIImage(data: data)
        }
    }
}
