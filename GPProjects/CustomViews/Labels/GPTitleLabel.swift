//
//  GPTitleLabel.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 24/12/20.
//
import UIKit

class GPTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
     init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment   = textAlignment
        self.font            = UIFont.systemFont(ofSize: fontSize, weight: .bold )
        configure()
    }
    
    private func configure(){
        textColor                   = .black
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.90
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
