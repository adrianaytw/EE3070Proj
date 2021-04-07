//
//  ProductDetailViewController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 30/3/2021.
//

import UIKit

class ProductDetailViewController: BaseViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var availableView: UIView!
    @IBOutlet weak var avaliableLabel: UILabel!
    @IBOutlet weak var productTypeLabel: UILabel!
    
    var product:Product?
    var rootRouter: RootRouter? {
       return router as? RootRouter
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiBind(product: product!)

        // Do any additional setup after loading the view.
    }
    
    func uiBind(product: Product){
        productNameLabel.text = product.productName
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
