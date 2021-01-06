//
//  GPProfileOfUserVC.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 24/12/20.
//

import UIKit

class GPProfileOfUserVC: UIViewController {
    let stackView       = UIStackView()
    let tableView       = UITableView()
    var fullNameOfUser  = GPTitleLabel(textAlignment: .center, fontSize: 20)
    let locationOfUser  = GFSecondaryTitleLabel(fontSize: 18)
    let avatarimage = GPImageView(frame: .zero)
    let padding: CGFloat = 20
    
    
    var projects: [Projects]  = []
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
        getProjectsList()
        setStackView()
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setStackView(){
        
        view.addSubview(avatarimage)
        view.addSubview(stackView)
        view.backgroundColor = .white
        
        stackView.axis           = .vertical
        stackView.distribution   = .equalCentering
        // stackView.addArrangedSubview(avatarimage)
        stackView.addArrangedSubview(fullNameOfUser)
        stackView.addArrangedSubview(locationOfUser)
        stackView.backgroundColor = .white
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        avatarimage.translatesAutoresizingMaskIntoConstraints = false
        
        avatarimage.image = UIImage(systemName: "person.circle")
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: avatarimage.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //stackView.heightAnchor.constraint(equalToConstant: 220),
            
            avatarimage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            avatarimage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarimage.heightAnchor.constraint(equalToConstant: 100),
            avatarimage.widthAnchor.constraint(equalToConstant: 100),
            
            fullNameOfUser.topAnchor.constraint(equalTo: avatarimage.bottomAnchor, constant: 15),
            fullNameOfUser.centerXAnchor.constraint(equalTo: avatarimage.centerXAnchor),
            fullNameOfUser.heightAnchor.constraint(equalToConstant: 30),
            
            locationOfUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationOfUser.topAnchor.constraint(equalTo: fullNameOfUser.bottomAnchor),
            locationOfUser.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -20)
        ])
        
    }
    
    
    func getProjectsList(){
        
        NetworkManager.shared.getProjects(for: username){ [weak self] result  in
            
            switch result {
            case .success( let projects):
                self?.projects = projects
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(_):
                print("sorry")
            }
            
        }
        
    }
    
    func getUserInfo(){
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else {return}
            print(self.username ?? " ")
            
            switch result{
            case .success(let user):
                
                DispatchQueue.main.async {
                    
                    self.avatarimage.downloadImage(from: "\(user.avatarUrl)")
                    self.fullNameOfUser.text = user.login
                    print(user)
                    self.locationOfUser.text = user.location ?? ""
                }
                
            case .failure(_):
                print("error has been detected")
            }
        }
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(GPProjectsCell.self, forCellReuseIdentifier: GPProjectsCell.reuseID)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
}


extension GPProfileOfUserVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GPProjectsCell.reuseID, for: indexPath) as! GPProjectsCell
        cell.model = projects[indexPath.row]
        
        return cell
    }
}
