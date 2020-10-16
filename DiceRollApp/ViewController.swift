//
//  ViewController.swift
//  DiceRollApp
//
//  Created by 陳飛 on 16/10/20.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    // MARK: - Loading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("The scene is loaded!")
        
        // Display welcome string
        let welcomeString = "Welcome!\nClick to roll the dice"
        infoLabel.text = welcomeString
    }
    
    // MARK: - Roll Button Action Method
    
    @IBAction func rollDiceButton(_ sender: Any) {
        
        print("Roll Button Tapped!")
        
        // Randomize to get the number of dice
        let randNum = Int.random(in: 1...6)
        
        // Show animation to roll the dice to firstImageView
        let animationImageNum = 6
        let durationAnimated = 0.75
        var tempInt = [Int]()
        var animationSet = [UIImage]()
        
        // Get a sequence of images to make animated one
        for _ in 0..<animationImageNum {
            
            var randTemp: Int
            repeat{
                
                randTemp = Int.random(in: 1...6)
                if tempInt.contains(randTemp) {
                    
                }
                else {
                    tempInt.append(randTemp)
                    break
                }
            } while true
            
            animationSet.append(UIImage(named: "Dice\(randTemp)")!)
        }
        let animatedImage = UIImage.animatedImage(with: animationSet, duration: TimeInterval.init(durationAnimated))
        
        firstImageView.image = animatedImage
        
        print("You got \(randNum).")
        
        // Make main thread to delay to present image animation
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(animationImageNum)*durationAnimated) {
            
            // Display the result image of number we got to secondImageView
            self.firstImageView.image = UIImage(named: "Dice\(randNum)")
            
            // Change the view order between first and second image view
            
            
            // Show the result to label
            self.infoLabel.text = "Congratulations!\nYou got \(randNum)"
        }
    }
}

