//
//  ShoppingListViewController.swift
//  ZopNowJsonParsingDemo
//
//  Created by Bhushan Udawant on 30/10/18.
//  Copyright © 2018 Bhushan Udawant. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController {


    // MARK: Constants

    let baseURL = "https://www.zopnow.com/index.json?medium=APP"

    // MARK: IBOutlets

    @IBOutlet weak var shoppingList: UITableView!

    // MARK: Life Cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // Fetch shopping list
        fetchShoppingList()
    }

    // MARK: Helper methods

    private func fetchShoppingList() {
        let session = URLSession.shared

        guard let url = URL(string: baseURL) else {
            // Alert invalid url
            return
        }

        let request = URLRequest(url: url)

        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                // Alert network error
                print(error.localizedDescription)
                return
            }

            if let data = data {
                do {
                    let hotOffersIndex = 3

                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? Array<Dictionary<String, Any>>
                    let data = jsonObject![hotOffersIndex]["data"] as? Dictionary<String, Any>
                    let products = data!["products"] as? Array<Dictionary<String, Any>>

                    for product in products! {
                        let id = product["id"] as? String
                        let name = product["name"] as? String
                        let fullName = product["full_name"] as? String

                        let brand = product["brand"] as? Dictionary<String, Any>
                        let brandId = brand!["id"] as? String
                        let brandName = brand!["name"] as? String

                        let category = product["category"] as? Dictionary<String, Any>
                        let productCount = category!["products_count"] as? String
                        let imageUrl = category!["image_url"] as? String


                        let variants = product["variants"] as? Array<Dictionary<String, Any>>

                        for variant in variants! {
                            let variantId = variant["id"] as? String
                            let nameQuantity = variant["name"] as? String
                            let fullName = variant["full_name"] as? String
                            let status = variant["status"] as? String
                            let currency = variant["currency"] as? String
                            let mrp = variant["mrp"] as? Double
                            let discount = variant["discount"] as? Double
                            let stock = variant["stock"] as? Int

                        }
                    }

                    print(products)


                } catch let jsonError {
                    //Alert json parsing
                    print(jsonError.localizedDescription)
                }
            }
        }

        task.resume()
    }

}

