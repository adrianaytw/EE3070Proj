//
//  HomeViewController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 18/3/2021.
//

import UIKit
import Realm
import RealmSwift
import RxSwift
import RxCocoa

class SearchViewController: BaseViewController,  UITableViewDataSource, UITableViewDelegate {

    var products: Results<Product>?
    var productList =  BehaviorRelay<[Product?]>(value: [nil])
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var rootRouter: RootRouter? {
       return router as? RootRouter
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getUser{ [weak self] (failReason) in
            
               if failReason != nil {
                 self?.showErrorAlert(reason: failReason, showCache: true, okClicked: nil)
               }

        }
        
        getProducts{ [weak self] (failReason) in
            
               if failReason != nil {
                 self?.showErrorAlert(reason: failReason, showCache: true, okClicked: nil)
               }

        }
        
        uiInit()
        productList.asObservable().subscribe(onNext: { classValue in
            
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
       

        // Do any additional setup after loading the view.
    }
    
    func uiInit(){
        testButton.backgroundColor = UIColor.yellow
    
    }

    @IBAction func testClicked(_ sender: Any) {
        rootRouter?.showTest2()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
        print(productList.value)
        rootRouter?.showProductDetail(product: (products?[indexPath.row])!)
//        rootRouter?.showProductDetail(product: Product().demoProduct())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SearchListTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchListTableViewCell else {
          fatalError("The dequeued cell is not an instance of SearchListTableViewCell.")
        }
        cell.uiBind(product: (products?[indexPath.row])!)
          return cell
    }
    
    @IBAction func refreshClicked(_ sender: Any) {
        self.getProducts(completed: { [weak self] (failReason) in
            
            if failReason != nil {
              self?.showErrorAlert(reason: failReason, showCache: true, okClicked: nil)
            }

     })
    }
    
    func getUser(completed: ((SyncDataFailReason?) -> Void)?){
      SyncData().syncUser(completed: completed)
    }
    
    func productListRemoveAll(){
        var array = productList.value
        array.removeAll()
        productList.accept(array)
    }
    
    func fetchProductsfromRealm(){
       products = try? Realm().objects(Product.self)
        productListRemoveAll()
        var array = productList.value
        for i in 0..<products!.count ?? 0..<0{
            array.insert(products?[i], at: i)
        }
        productList.accept(array)
        print(productList.value)
//        productList.accept()
    }
    
    func getProducts(completed: ((SyncDataFailReason?) -> Void)?){
      SyncData().syncProducts(completed: completed)
        fetchProductsfromRealm()
    }

}


