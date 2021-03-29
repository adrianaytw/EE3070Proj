//
//  HomeViewController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 18/3/2021.
//

import UIKit

class SearchViewController: BaseViewController,  UITableViewDataSource, UITableViewDelegate {

    

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
        uiInit()
        self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func uiInit(){
        testButton.backgroundColor = UIColor.yellow
    
    }

    @IBAction func testClicked(_ sender: Any) {
        rootRouter?.showTest2()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SearchListTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchListTableViewCell else {
          fatalError("The dequeued cell is not an instance of SearchListTableViewCell.")
        }
//          cell.uiBind(classes: (viewModel.getTodayClassArray()?[indexPath.row]))
          return cell
    }

}
