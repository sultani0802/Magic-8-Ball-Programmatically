//
//  BallContainerView.swift
//  Magic 8 Ball Programmatically
//
//  Created by Haamed Sultani on 9/27/18.
//  Copyright © 2018 Sultani. All rights reserved.
//

import UIKit

class BallContainerView: UIView {
    
    //MARK: - Get a reference to our Answer model object
    var answer: Answer? {
        didSet {
            guard let unwrappedAnswer = answer else {return} // Safely unwrap the model
            ballImageView.image = UIImage(named: unwrappedAnswer.imageFileName) // Grab the image
            
        }
    }
    
    //MARK: - UI Elements
    var ballImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // Set how the image fits inside the bounds of the imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup UI Methods
    private func setupImageView(){
        addSubview(ballImageView)
        
        NSLayoutConstraint.activate([
            ballImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ballImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ballImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            ballImageView.widthAnchor.constraint(equalTo: self.widthAnchor)
            ])
    }
    
    
    //MARK: - Update UI Methods
    func setRandomImage(img: String) {
        ballImageView.image = UIImage(named: img)
    }
}
