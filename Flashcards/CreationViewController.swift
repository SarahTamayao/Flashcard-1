//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Fakun, Amish on 3/6/21.
//

import UIKit

class CreationViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UITextField!
    
    
    @IBOutlet weak var answerLabel: UITextField!
    
    var intialQuestion: String?
    var initialAnswer: String?
    
    
    @IBOutlet weak var extraAnswerOne: UITextField!
    
    @IBOutlet weak var extraAnswerTwo: UITextField!
    
    @IBOutlet weak var extraAnswerThree: UITextField!
    
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = intialQuestion
        answerLabel.text = initialAnswer

       
        
        
        
    }
    
    

    
    @IBAction func didTapOnCancel(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    
  
    
    
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        
        let questionText = questionLabel.text
        
        let answerText = answerLabel.text
        
//        let AlternateOne = extraAnswerOne.text
//        let AlternateTwo = extraAnswerTwo.text
//        let AlternateThree = extraAnswerThree.text
//        
       
        
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty)
        {
            let alert = UIAlertController(title: "Missing Text", message: "Question and answer fields cannot be empty", preferredStyle: UIAlertController.Style .alert)
            
            present(alert, animated: true)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
        }
        else
        {
            
        
            
            flashcardsController.updateFlashcard(Question: questionText!, Answer: answerText!, AlternateOne: extraAnswerOne.text!, AlternateTwo: extraAnswerTwo.text!, AlternateThree: extraAnswerThree.text!)
            
            dismiss(animated: true)
            
        }
        
    }
    
    
    
}
