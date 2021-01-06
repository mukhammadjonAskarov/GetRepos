//
//  GPProjectsCell.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 06/01/21.
//

import UIKit

class GPProjectsCell: UITableViewCell {
    
    static let reuseID = "ProjectsCell"
    
    lazy var projectsNameLabel = GPTitleLabel(textAlignment: .left, fontSize: 22)
    lazy var projectsFullName  = GFSecondaryTitleLabel()
    
    
    lazy var watchersCountImage      = UIImageView()
    
    lazy var watchersCountLabel      = GPTitleLabel(textAlignment: .left, fontSize: 12)
    lazy var starsImage              = UIImageView()
    lazy var starsGazersCountLabel   = GPTitleLabel(textAlignment: .left, fontSize: 12)
    lazy var forksImage              = UIImageView()
    lazy var forksCountLabel         = GPTitleLabel(textAlignment: .left, fontSize: 12)
    
    lazy var stackView = UIStackView()
    
    var model: Projects! {
        didSet {
            projectsNameLabel.text      = model.name
            projectsFullName.text       = model.full_name
            watchersCountLabel.text     = String(model.watchers_count)
            starsGazersCountLabel.text  = String(model.stargazers_count)
            forksCountLabel.text        = String(model.forks_count)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        projectsFullName.textAlignment = .left
        projectsFullName.font          = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        watchersCountImage.image    = UIImage(systemName: "eye")
        watchersCountImage.tintColor  = .black
        starsImage.image            = UIImage(systemName: "star.fill")
        starsImage.tintColor        = .black
        forksImage.image            = UIImage(systemName:  "tuningfork")
        forksImage.tintColor        = .black
        
        contentView.addSubview(projectsNameLabel)
        contentView.addSubview(projectsFullName)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis              = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(watchersCountImage)
        stackView.addArrangedSubview(watchersCountLabel)
        stackView.addArrangedSubview(starsImage)
        stackView.addArrangedSubview(starsGazersCountLabel)
        stackView.addArrangedSubview(forksImage)
        stackView.addArrangedSubview(forksCountLabel)
        
        
        projectsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        projectsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        watchersCountImage.translatesAutoresizingMaskIntoConstraints = false
        watchersCountLabel.translatesAutoresizingMaskIntoConstraints = false
        starsImage.translatesAutoresizingMaskIntoConstraints         = false
        starsGazersCountLabel.translatesAutoresizingMaskIntoConstraints = false
        forksImage.translatesAutoresizingMaskIntoConstraints            = false
        forksCountLabel.translatesAutoresizingMaskIntoConstraints        = false
        
        NSLayoutConstraint.activate([
            
            projectsNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            projectsNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            projectsNameLabel.heightAnchor.constraint(equalToConstant: 22),
            projectsNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            projectsFullName.topAnchor.constraint(equalTo: projectsNameLabel.bottomAnchor, constant: 4),
            projectsFullName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            projectsFullName.heightAnchor.constraint(equalToConstant: 18),
            projectsFullName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
//
            watchersCountImage.heightAnchor.constraint(equalToConstant: 15),
            watchersCountImage.widthAnchor.constraint(equalToConstant: 15),
            starsImage.heightAnchor.constraint(equalToConstant: 15),
            starsImage.widthAnchor.constraint(equalToConstant: 18),
            forksImage.heightAnchor.constraint(equalTo: starsImage.heightAnchor),
            forksImage.widthAnchor.constraint(equalTo: starsImage.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: projectsFullName.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            
        ])
        
        
    }
    
}
