//
//  GPSecondaryTitleLabel.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 24/12/20.
//
import UIKit

class GFSecondaryTitleLabel: UILabel {
  
    override init(frame: CGRect) {
         super.init(frame: frame)
         configure()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
      init(fontSize: CGFloat) {
         super.init(frame: .zero)
        font      = UIFont.systemFont(ofSize: fontSize, weight: .medium)
         configure()
     }
     
     private func configure(){
        textColor                   = .darkGray
         adjustsFontSizeToFitWidth   = true
         minimumScaleFactor          = 0.90
         lineBreakMode               = .byTruncatingTail
         translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
     }
}
