//
//  TopContainerView.swift
//  Magic 8 Ball Programmatically
//
//  Created by Haamed Sultani on 9/27/18.
//  Copyright © 2018 Sultani. All rights reserved.
//

import UIKit


class TopContainerView: UIView {
    
    var appTitleTextView: UITextView = {
        // Create the text view
        let textView = UITextView()
        // Create the attributed text
        var attributedText = NSMutableAttributedString(string: "Ask Me Anything!",
                                                       attributes: [
                                                        NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)
            ])
        // Set the textView's text
        textView.attributedText = attributedText
        // Set the alignment of that text
        textView.textAlignment = .center
        // Don't let user interact with the textview
        textView.isUserInteractionEnabled = false
        // Enable auto layout
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // FOR TESTING PURPOSES ONLY
        setupTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupTextView(){
        // Add the textView and the constraints to topContainerView
        addSubview(appTitleTextView)
        
        NSLayoutConstraint.activate([
            appTitleTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            appTitleTextView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),    //Spacing on the left side
            appTitleTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20), //Spacing on the right side
            appTitleTextView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
