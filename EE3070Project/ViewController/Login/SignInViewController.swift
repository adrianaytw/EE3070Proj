//
//  SignInViewController.swift
//  EE3070Project
//
//  Created by Bowie Tso on 10/4/2021.
//
import UIKit
import RxSwift
import RxCocoa
import RealmSwift
import FirebaseFirestore
import FirebaseAuth

class SignInViewController: BaseViewController, UITextFieldDelegate {
    
    var disposeBag = DisposeBag()

    @IBOutlet weak var sidTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reEnterTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var buttonBackgroundView: UIView!
    
    @IBOutlet weak var buttonLine: UIView!
    var rootRouter: RootRouter? {
       return router as? RootRouter
     }
    
    var db: Firestore!
    var memIdInput = BehaviorRelay<String?>(value: nil)
    var passwordInput = BehaviorRelay<String?>(value: nil)
    var reInputPassword = BehaviorRelay<String?>(value: nil)
    var emailInput = BehaviorRelay<String?>(value: nil)
    var nameInput = BehaviorRelay<String?>(value: nil)
    var phoneInput = BehaviorRelay<String?>(value: nil)
    var signInEnable = BehaviorRelay<Bool>(value: false)
    
    func enableCheck(){
        if(memIdInput.value != "" && memIdInput.value?.count == 8 &&
            passwordInput.value != "" && reInputPassword.value != "" && passwordInput.value == reInputPassword.value &&
            emailInput.value != "" && nameInput.value != "" && phoneInput.value != ""){
            signInEnable.accept(true)
        }
        else{
            signInEnable.accept(false)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sidTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        reEnterTextField.delegate = self
        self.navigationItem.title = "Register"
        db = Firestore.firestore()
        configureUI()
        
        sidTextField.rx.text.orEmpty.asObservable()
            .subscribe(onNext: {_ in
                self.memIdInput.accept(self.sidTextField.text)
                self.enableCheck()
            })
            .disposed(by: disposeBag)
        
        emailTextField.rx.text.orEmpty.asObservable()
            .subscribe(onNext: {_ in
                self.emailInput.accept(self.emailTextField.text)
                self.enableCheck()
            })
            .disposed(by: disposeBag)
        
        nameTextField.rx.text.orEmpty.asObservable()
            .subscribe(onNext: {_ in
                self.nameInput.accept(self.nameTextField.text)
                self.enableCheck()
            })
            .disposed(by: disposeBag)
        
        phoneTextField.rx.text.orEmpty.asObservable()
            .subscribe(onNext: {_ in
                self.phoneInput.accept(self.phoneTextField.text)
                self.enableCheck()
            })
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty.asObservable()
            .subscribe(onNext: {_ in
                self.passwordInput.accept(self.passwordTextField.text)
                self.enableCheck()
            })
            .disposed(by: disposeBag)
        
        reEnterTextField.rx.text.orEmpty.asObservable()
            .subscribe(onNext: {_ in
                self.reInputPassword.accept(self.reEnterTextField.text)
                self.enableCheck()
            })
            .disposed(by: disposeBag)
        
        
        signInEnable.asObservable().subscribe(onNext: { (_) in
            self.signInButton.isEnabled = (self.signInEnable.value)
            if (!(self.signInButton.isEnabled)){
//                self.signInButton.titleLabel?.textColor = UIColor.init(red: 128, green: 128, blue: 128)
                self.buttonBackgroundView.backgroundColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 0.2)
                self.buttonLine.backgroundColor = UIColor.init(red: 128, green: 128, blue: 128)
            }else{

//                self.signInButton.titleLabel?.textColor = UIColor.init(red: 255, green: 189, blue: 43)
                self.buttonLine.backgroundColor = UIColor.systemOrange
                self.buttonBackgroundView.backgroundColor = UIColor.init(red: 255/255, green: 189/255, blue: 43/255, alpha: 0.1)
            }
          }).disposed(by: disposeBag)
        
        // Do any additional setup after loading the view.
    }
    
    func configureUI(){
        sidTextField.textColor = UIColor.init(red: 96,green: 96,blue: 96)
        sidTextField.borderColor = UIColor.init(red: 168,green: 168,blue: 168)
        emailTextField.textColor = UIColor.init(red: 96,green: 96,blue: 96)
        emailTextField.borderColor = UIColor.init(red: 168,green: 168,blue: 168)
        nameTextField.textColor = UIColor.init(red: 96,green: 96,blue: 96)
        nameTextField.borderColor = UIColor.init(red: 168,green: 168,blue: 168)
        phoneTextField.textColor = UIColor.init(red: 96,green: 96,blue: 96)
        phoneTextField.borderColor = UIColor.init(red: 168,green: 168,blue: 168)
        passwordTextField.textColor = UIColor.init(red: 96,green: 96,blue: 96)
        passwordTextField.borderColor = UIColor.init(red: 168,green: 168,blue: 168)
        reEnterTextField.textColor = UIColor.init(red: 96,green: 96,blue: 96)
        reEnterTextField.borderColor = UIColor.init(red: 168,green: 168,blue: 168)
        self.signInButton.setTitleColor(UIColor.init(red: 255, green: 189, blue: 43), for: .normal)
        self.signInButton.setTitleColor(UIColor.init(red: 128, green: 128, blue: 128), for: .disabled)
        self.buttonLine.backgroundColor = UIColor.init(red: 128, green: 128, blue: 128)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case sidTextField : emailTextField.becomeFirstResponder()
            break
        case emailTextField : nameTextField.becomeFirstResponder()
        case nameTextField : phoneTextField.becomeFirstResponder()
        case phoneTextField : passwordTextField.becomeFirstResponder()
        case passwordTextField: reEnterTextField.becomeFirstResponder()
        case reEnterTextField: reEnterTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }

    
    @IBAction func signInClicked(_ sender: Any) {

        if(passwordTextField.text != reEnterTextField.text){
            showAlert("Please Re-Enter Password!")
        }
        
        memIdInput.accept(sidTextField.text)
        emailInput.accept(emailTextField.text)
        nameInput.accept(nameTextField.text)
        phoneInput.accept(phoneTextField.text)
        
//        Api().checkSidValid(sid: (viewModel?.sidInput.value)!, success: {(response) in
//            guard let valid = response else{
//                self.showAlert("Fail to Register your Account")
//                return
//            }
//
//            if (valid.valid){

        Auth.auth().createUser(withEmail: (self.emailInput.value)!, password: (self.passwordInput.value)!){ [self] (user, error) in
                    if error == nil {
                        self.navigationController?.popViewController(animated: true)
                        db.collection("users").addDocument(data: [
                            "name": nameInput.value!,
                            "memId": memIdInput.value!,
                            "email": emailInput.value!,
                            "phone": phoneInput.value!,
                            "uid": user?.user.uid
                        ]) { (error) in
                            if let error = error {
                                self.showAlert(error.localizedDescription)
                                print(error)
                            }
                        }
                    }
                    else{
                        self.showAlert(error?.localizedDescription)
                        print(error)
                    }

                }

//            }
//            else{
//                self.showAlert("Your Account had been Registered")
//            }
//
//        }, fail: { (error, resposne) in
//            print("Reqeust Error: \(String(describing: error))")
////            let reason = self.failReason(error: error, resposne: resposne)
//            self.showAlert("Fail to Register your Account")
//        })
//        navigationController?.popViewController(animated: true)
    }


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

