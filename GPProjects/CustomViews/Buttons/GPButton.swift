//
//  GPButton.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 23/12/20.
//

import UIKit

class GPButton: UIButton {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        
        layer.cornerRadius          = 20
        titleLabel?.textColor       = .white
        titleLabel?.textAlignment   = .center
        backgroundColor             = .systemGreen
        titleLabel?.font            = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
    


