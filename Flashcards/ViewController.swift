//
//  ViewController.swift
//  Flashcards
//
//  Created by Fakun, Amish on 2/20/21.
//

import UIKit

struct Flashcard
{
    var question: String
    var answer: String
}


class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var butonTwo: UIButton!
    @IBOutlet weak var butonThree: UIButton!
    
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    //Array to hold our flashcards
    var flashcards = [Flashcard]()
    
    //current flashcard index
    var currentIndex = 0 //initialize to zero since first index in array
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        readSavedFlashcards()
        
        if (flashcards.count == 0)
        {
            
            updateFlashcard(Question: "What's the capital of brazil", Answer: "brasilia", AlternateOne: "RDJ", AlternateTwo: "Brasilia", AlternateThree: "Sao Paulo")

            
        }
        
        else
        {
            updateLabels()
            updateNextPrevButtons()
        }
        
                
        
        
        
    
            
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
    
    func updateFlashcard(Question : String, Answer : String, AlternateOne: String, AlternateTwo: String, AlternateThree: String) {
        
        let flashcard = Flashcard(question: Question, answer: Answer)
        
        
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer
        
        flashcards.append(flashcard)
        
        //Console Logging
        
        currentIndex = flashcards.count - 1
        
        print("we now have \(flashcards.count) flashcards ")
        print(" :] Our current index is \(currentIndex)")
        

        

        
        
    
        buttonOne.setTitle(AlternateOne, for: .normal)
        butonTwo.setTitle(AlternateTwo, for: .normal)
        butonThree.setTitle(AlternateThree, for: .normal)
        
        //Update buttons
        updateNextPrevButtons()
        
        //Update Labels
        updateLabels()
        
        //Save flashcard to disk
        saveAllFlashcardsToDisk()
    }
    
    
    func updateNextPrevButtons()
    {
        
        //Disable next button if reached end of array
        if (currentIndex == flashcards.count - 1)
        {
            nextButton.isEnabled = false
        }

        else
        {
            nextButton.isEnabled = true
        }
        
        if(flashcards.count == 1) //if currentIndex is of size 0 then it should mean that there is only one flashcard and we cannot go back
        {
            prevButton.isEnabled = false
        }
        else
        {
            prevButton.isEnabled = true
        }
    }
    
    
    func updateLabels()
    {
        //Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        
        //update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    
    }
    
    func saveAllFlashcardsToDisk ()
    {
        
        let dictionaryArray = flashcards.map { (card) -> [String : String] in
            
            return["question" : card.question, "answer" : card.answer]
        }
        
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        //Console Logging
        print(">:) Flashcards saved to UserDefaults")
        
    }
    
    func readSavedFlashcards ()
    {
        
        //Read dictionary array from disk (if any)
        
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String : String]]
        {
            //In here we know we have a dictionary array
            
            let savedCards = dictionaryArray.map { (dictionary) -> Flashcard in
                
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            //put cards in flashcard array
            flashcards.append(contentsOf: savedCards)
            
            
        }
        
        
        
        
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
    
    
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        currentIndex = currentIndex - 1
       
        //update labels
        updateLabels()
        
        //update buttons
        updateNextPrevButtons()
        
        
        
        
    }
    
    
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        currentIndex = currentIndex + 1
        
        //update labels
        updateLabels()
        
        //update buttons
        updateNextPrevButtons()
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
        
        
        if segue.identifier == "EditSegue"
        {
            
            creationController.intialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
            
        }
        
        
    }
    
    
}

