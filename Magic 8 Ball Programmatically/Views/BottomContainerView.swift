//
//  BottomContainerView.swift
//  Magic 8 Ball Programmatically
//
//  Created by Haamed Sultani on 9/28/18.
//  Copyright © 2018 Sultani. All rights reserved.
//

import UIKit

class BottomContainerView: UIView {
    
    //MARK: - UI Elements
    private var rollButton: UIButton = {
        var button = UIButton()
        button.setTitle("ROLL", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        // Creating a border for the button
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        // Call a method every time someone taps the button
        button.addTarget(self, action: #selector(ViewController.buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: UI Setup Methods
    func setupButton(){
        addSubview(rollButton)
        NSLayoutConstraint.activate([
            rollButton.centerXAnchor.constraint(equalTo: centerXAnchor),                        // Spacing to the bottom of the container
            rollButton.centerYAnchor.constraint(equalTo: centerYAnchor),                        // Spacing to the left of the container
            rollButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.50),        // Spacing to the right of the container
            rollButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.50)           // Spacing to the top of the container
            ])
    }
}
