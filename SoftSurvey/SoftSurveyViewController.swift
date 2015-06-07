//
//  SoftSurveyViewController.swift
//  SoftSurvey
//
//  Created by shelley weiss on 5/13/15.
//  Copyright (c) 2015 shelley weiss. All rights reserved.
//

import UIKit


class SoftSurveyViewController : UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblText: UILabel!
    
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    @IBOutlet var txtAnswerFree: UITextField! = nil

    @IBOutlet weak var v4Answer: UIView!
    @IBOutlet weak var vFreeText: UIView!
    
    private var buttonsArray = [UIButton]()
    private var buttonController = SoftButtonsController()

    var toPass:String! = nil

    var currentQuestion: SoftQuestion?
    let survey = SoftSurvey<SoftQuestion>()
    
    var currentAnswer: String?
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
    
        let btnBack = UIBarButtonItem(title: "Back", style: .Plain ,target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = btnBack;
        
        var btnContinue = UIBarButtonItem(title: "Continue", style: .Plain, target: self, action: "pressed:")
        self.navigationItem.rightBarButtonItem = btnContinue;
        
        txtAnswerFree.delegate=self
        buttonsArray = [answerA!,answerB!,answerC!, answerD!]
        
        buttonController.setButtonsArray(buttonsArray)
        
        survey.upload()
        load()

    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func answerFreeTextDidChange(sender: AnyObject)
    {
      
        if (txtAnswerFree.text.isEmpty)
        {
           //TOdo: add alarm
            
        }
        load()
    }
    
  
    func load()
    {
       
        if survey.isEmpty()
        {
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        else
        {
            currentQuestion = survey.dequeue()
            lblTitle.hidden = false
        
            lblTitle.text = "Question \(currentQuestion!.value)"
            lblText.text = currentQuestion?.question
            loadAnswers(currentQuestion!.optionalAnswers)
        }
    }
    
    func loadAnswers(answers : [String]!)
    {
        
        if answers.count <= 1
        {
            vFreeText.hidden = false
            v4Answer.hidden = true
        }
        else
        {
            
            vFreeText.hidden = true
            v4Answer.hidden = false
            
            answerA.selected = false
        
            answerA.setTitle("1.  \(currentQuestion!.ask(1))", forState: UIControlState.Normal)
            answerB.setTitle("2. \(currentQuestion!.ask(2))", forState: UIControlState.Normal)
            answerC.setTitle( "3. \(currentQuestion!.ask(3))", forState: UIControlState.Normal)
            answerD.setTitle("4. \(currentQuestion!.ask(4 ))", forState: UIControlState.Normal)
        }
 
    }
    
    
    @IBAction func pressed(sender: AnyObject)
    {

        if survey.isEmpty()
        {
            self.navigationController?.popViewControllerAnimated(true)
            
        }
        let timeStamp = NSDate()
        load()
        
    }
    
    
    func back(sender: UIBarButtonItem)
    {
        // Back to the previous ViewController
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
