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
    @IBOutlet weak var quantityLabel: UILabel!
    
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
        productCodeLabel.text = product.productCode
        priceLabel.text = "$ \(product.price)"
        if product.avaliable{
            availableView.borderColor = UIColor.green
            avaliableLabel.text = "Avaliable"
            avaliableLabel.textColor = UIColor.green
        }else{
            availableView.borderColor = UIColor.red
            avaliableLabel.text = "Not Avaliable"
            avaliableLabel.textColor = UIColor.red
        }
        quantityLabel.text = "\(product.remainquantity)"
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
