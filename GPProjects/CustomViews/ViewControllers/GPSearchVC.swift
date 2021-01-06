//
//  GPSearchVC.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 23/12/20.
//

import UIKit

class GPSearchVC: UIViewController {

    let backgroundImageView = UIImageView()
    let logoImageView       = UIImageView()
    let searchtextfield     = GPTextField()
    let searchButton        = GPButton()
    let stackview           = UIStackView()
    
    var isUsernameEntered: Bool{ return !searchtextfield.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        setLogo()
        setStackView()
        setTextField()
        setSearchButton()
        createDismissKeyboardTapGesture()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setLogo(){
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 130),
            logoImageView.heightAnchor.constraint(equalToConstant: 120)
            
        ])
    }
    
    
    private func setStackView(){
        view.addSubview(stackview)
        stackview.axis           = .vertical
        stackview.distribution   = .equalSpacing
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.addArrangedSubview(searchtextfield)
        stackview.addArrangedSubview(searchButton)
        
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            stackview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
        
    }

  
    func setTextField(){
        searchtextfield.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            searchtextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            searchtextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
           searchtextfield.topAnchor.constraint(equalTo: stackview.topAnchor, constant: 20),
            searchtextfield.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func setSearchButton(){
        searchButton.addTarget(self, action: #selector(showProfileOfUser), for: .touchUpInside)

        searchButton.setTitle("GO", for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            searchButton.bottomAnchor.constraint(equalTo: stackview.bottomAnchor),
            searchButton.heightAnchor.constraint(equalTo: searchtextfield.heightAnchor),
            searchButton.widthAnchor.constraint(equalTo: searchtextfield.widthAnchor, multiplier: 0.5),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
   @objc func showProfileOfUser(){
    
    guard isUsernameEntered else {
        presentGFAlertOnMainThread(title: "Empty username", message: "Please, Enter a username. We need to know who to look for 😄.", buttonTitle: "Ok")
         return
    }
    
        let profileVC       = GPProfileOfUserVC()
        profileVC.username    = searchtextfield.text ?? ""
        navigationController?.pushViewController(profileVC, animated: true)
    
   }
    
    func setBackgroundImage(){
        backgroundImageView.image = UIImage(named: "image")
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
}
extension GPSearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       // showProfileOfUser()
         return true
    }
   
}
