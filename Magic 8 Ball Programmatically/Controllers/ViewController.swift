//
//  ViewController.swift
//  Magic 8 Ball Programmatically
//
//  Created by Haamed Sultani on 9/27/18.
//  Copyright © 2018 Sultani. All rights reserved.
//

import UIKit

struct Answer {
    var imageFileName: String   // This will hold the filename of the image
    var answerText: String      // This will hold the text of the answer from the 8 ball
}

class ViewController: UIViewController {

    
    //MARK: - Constants
    let hapticFeedback = UIImpactFeedbackGenerator()
    
    //MARK: - Variables
    var answers : [Answer] = [
        Answer(imageFileName: "ball1", answerText: "Yes"),
        Answer(imageFileName: "ball2", answerText: "No"),
        Answer(imageFileName: "ball3", answerText: "Ask again later"),
        Answer(imageFileName: "ball4", answerText: "The answer is yes"),
        Answer(imageFileName: "ball5", answerText: "I have no idea")
    ]
    
    
    
    
    //MARK: - UI Elements
    private var topContainerView: TopContainerView = {
        var container = TopContainerView()
        container.translatesAutoresizingMaskIntoConstraints = false

        return container
    }()
    
    private var ballContainerView: BallContainerView = {
        var container = BallContainerView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    private var bottomContainerView: BottomContainerView = {
        var container = BottomContainerView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    
    //MARK: - UI Setup Methods
    private func setupContainers(){
        // Add the top container to the subview
        view.addSubview(topContainerView)
        NSLayoutConstraint.activate([
            topContainerView.topAnchor.constraint(equalTo: view.topAnchor), // Spacing on the top of container
            topContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), // Spacing to the left of container
            topContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),   // Spacing to the right of the container
            topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)   // Height of a percentage of the whole screen
            ])
        
        // Add the middle container to the subview
        view.addSubview(ballContainerView)
        NSLayoutConstraint.activate([
            ballContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50), // Height of the ball container to be half
            ballContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),    // Spacing to the left of the containr
            ballContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)   // Spacing to the right of the container
            ])
        // Spacing between ball container to top container
        NSLayoutConstraint(item: ballContainerView, attribute: .top, relatedBy: .equal, toItem: topContainerView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        // Add the bottom container to the subview
        view.addSubview(bottomContainerView)
        NSLayoutConstraint.activate([
            bottomContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),  // Spacing to the left of the container
            bottomContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),// Spacing to the right of the container
            bottomContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),    // Spacing to the bottom of the container
            // Spacing to the top of the container
            NSLayoutConstraint(item: bottomContainerView, attribute: .top, relatedBy: .equal, toItem: ballContainerView, attribute: .bottom, multiplier: 1.0, constant: 0)
            ])
    }
    
    
    //MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContainers()
        ballContainerView.answer = answers[0]
    }
    
    func askQuestion(){
        
        hapticFeedback.impactOccurred()
        let ballIndex = Int.random(in: 0..<answers.count)
        ballContainerView.setRandomImage(img: self.answers[ballIndex].imageFileName)
    }
    
    
    @objc func buttonPressed() {
        askQuestion()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        askQuestion()
    }
}

