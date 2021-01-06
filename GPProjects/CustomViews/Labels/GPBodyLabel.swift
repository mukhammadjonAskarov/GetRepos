//
//  GPBodyLabel.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 24/12/20.
//

import UIKit

class GPBodyLabel: UILabel {
    

override init(frame: CGRect) {
     super.init(frame: frame)
     configure()
 }
 
 required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
 }

  init(textAlignment: NSTextAlignment) {
     super.init(frame: .zero)
     self.textAlignment   = textAlignment
     configure()
 }
 
 private func configure(){
     textColor                   = .secondaryLabel
     adjustsFontSizeToFitWidth   = true
     font                        = UIFont.preferredFont(forTextStyle: .body)
     minimumScaleFactor          = 0.75
     lineBreakMode               = .byWordWrapping
     translatesAutoresizingMaskIntoConstraints = false
 }
}
