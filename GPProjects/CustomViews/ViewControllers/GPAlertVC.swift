//
//  GPAlertVC.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 06/01/21.
//

import UIKit

class GFAlertVC: UIViewController {

    let containerView = UIView()
    
    let titleLabel   = GPTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GPBodyLabel(textAlignment: .center)
    let actionButton = GPButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle  = title
        self.message     = message
        self.buttonTitle = buttonTitle
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
       
    }
    
    func configureContainerView(){
        
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius  = 16
        containerView.layer.borderWidth   = 2
        containerView.layer.borderColor   = UIColor.white.cgColor
        containerView.backgroundColor     = .systemBackground
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 280),
            containerView.widthAnchor.constraint(equalToConstant: 220)
            
        ] )
    }
    
    func configureTitleLabel(){
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        
        ])
        
    }
    
    func configureActionButton(){
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
     
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        
    }

    func configureMessageLabel(){
        
        containerView.addSubview(messageLabel)
        messageLabel.text            = message ?? "Unable to complete your request"
        messageLabel.numberOfLines   = 4
        
        
        NSLayoutConstraint.activate([
        
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:-20),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        
        ])
        
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
}
