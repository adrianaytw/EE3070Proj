//
//  ProfileViewController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 2/4/2021.
//
import UIKit
//import RxSwift
import RealmSwift

class ProfileViewController: BaseViewController {

    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var chiNameTextField: UITextField!
    @IBOutlet weak var displayNameTextField: UITextField!
    @IBOutlet weak var sidTextField: UITextField!
    @IBOutlet weak var programTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    
    var viewModel: ProfileViewModel?
    
    var rootRouter: RootRouter? {
      return router as? RootRouter
    }
//    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ProfileViewModel()
        uiBind()
        
//        displayNameTextField.rx.text.orEmpty.asObservable()
//            .subscribe(onNext: {_ in
//                self.viewModel?.displayNameInput.value = self.displayNameTextField.text
//            })
//            .disposed(by: disposeBag)
//
//        Global.user.asObservable().subscribe(onNext: { student in
//
//            self.uiBind(student: Global.user.value!)
//          }).disposed(by: disposeBag)
        
    }
    
    func uiBind(){
        profileView.roundCorners(cornerRadius: 25)
        profileView.layer.applySketchShadow(
          color: .black,
          alpha: 0.4,
          x: 0,
            y: 0.5,
          blur: 6,
            spread: 0)
        updateButton.roundCorners(cornerRadius: 10)
        firstNameTextField.roundCorners(cornerRadius: 10)
        lastNameTextField.roundCorners(cornerRadius: 10)
        chiNameTextField.roundCorners(cornerRadius: 10)
        displayNameTextField.roundCorners(cornerRadius: 10)
        sidTextField.roundCorners(cornerRadius: 10)
        programTextField.roundCorners(cornerRadius: 10)
        majorTextField.roundCorners(cornerRadius: 10)
        
        
        
        
    }

//    @IBAction func updateClicked(_ sender: Any) {
//        viewModel?.updateDisplayName(updateName: (viewModel?.displayNameInput.value)!, sid: (Global.user.value?.studentId)!){[weak self] (failReason) in
//            if let tempUser = try? Realm().objects(Student.self){
//                Global.user.value = tempUser.first
//            }else{
//                self?.showErrorAlert(reason: failReason, showCache: true, okClicked: nil)
//               }
//              print(failReason)
//
//        }
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    
}

class ProfileViewModel{
    
//    var displayNameInput = Variable<String?>(nil)
//
//    func updateDisplayName(updateName: String, sid: String, completed: ((SyncDataFailReason?) -> Void)?){
//        SyncData().updateDisplayName(sid: sid, name: updateName, completed: completed)
//      }
}
