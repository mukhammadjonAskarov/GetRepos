//
//  GPTextField.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 23/12/20.
//

import UIKit

class GPTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        layer.cornerRadius        = 20
        layer.borderWidth         = 2
        layer.borderColor         = UIColor.systemGray4.cgColor
        textColor                 = .label
        tintColor                 = .label
        textAlignment             = .center
        font                      = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize           = 12
        backgroundColor           = .tertiarySystemBackground
        autocorrectionType        = .no
        placeholder               = "Search a username"
        returnKeyType             = .go
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}
