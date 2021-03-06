//
//  ViewController.swift
//  Flashcards
//
//  Created by Fakun, Amish on 2/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var butonTwo: UIButton!
    @IBOutlet weak var butonThree: UIButton!
    
    
    @IBOutlet weak var plusButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
            
    //Card formatting
        //card.clipsToBounds = true
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
       
    //front and back label formatting
        
        backLabel.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        backLabel.clipsToBounds = true
        frontLabel.clipsToBounds = true
        backLabel.layer.shadowRadius = 15.0
        backLabel.layer.shadowOpacity = 0.2
        frontLabel.layer.shadowRadius = 15.0
        frontLabel.layer.shadowOpacity = 0.2
        
    //button formatting
        
        buttonOne.layer.cornerRadius = 20.0
        butonTwo.layer.cornerRadius = 20.0
        butonThree.layer.cornerRadius = 20.0
        //add new formatting for plus button
        
        
        buttonOne.layer.borderWidth = 3.0
        buttonOne.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        butonTwo.layer.borderWidth = 3.0
        butonTwo.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
       
        butonThree.layer.borderWidth = 3.0
        butonThree.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        
        
        
    }
    
    
    @IBAction func didTapOnFlashCard(_ sender: Any) {
       
        frontLabel.isHidden = true
        
        

    }
    
    func updateFlashcard(Question : String, Answer : String) {
        
        
    }
    
    
    
    
    @IBAction func didTapOnFlashCardAgain(_ sender: Any) {
            
        
        if(frontLabel.isHidden == true)
        {
            frontLabel.isHidden = false
        }
        
        else if(frontLabel.isHidden == false)
        {
            frontLabel.isHidden = true
        }
        
    }
    
    
    @IBAction func didTapOptnOne(_ sender: Any) {
        
        frontLabel.isHidden = false;
    }
    
    @IBAction func didTapOptnTwo(_ sender: Any) {
        
        frontLabel.isHidden = true;
    }
    
    
    @IBAction func didTapOptionThree(_ sender: Any) {
        
        frontLabel.isHidden = false;
    }
    
    
}

