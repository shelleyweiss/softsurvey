//
//  SoftQuestion.swift
//  SoftSurvey
//
//  Created by shelley weiss on 3/4/15.
//  Copyright (c) 2015 shelley weiss. All rights reserved.
//

import UIKit

class SoftQuestion  {

    let value: Int!
    let question: String!
    var response: String? = nil
    
    //let content: String
    
    private enum Answer {
        case Single(NSArray)
        case Multiple(String)
        case FreeText(String, String -> String)
    }
    
    //private var answerStack = [Answer]()
    var optionalAnswers: [String]! = []
    //var isAnswered: Bool = false
    
    
    init(value: Int, text: String)//answers: [String])
    {
        self.question = text
        self.value = value
        
        
        optionalAnswers.append( "")
    }
    
    convenience init()
    {
        //Rule 2:  Calling another initializer in same class
        self.init( value:-2 , text: "Nothing" )
    }
    
    
    func pushAnswer(answer: String  )
    {
        if optionalAnswers.count <= 4
        {
            self.optionalAnswers.append(answer)
        }

    }
    
    func ask(index : Int) -> String {
        
        var result = ""
        if !optionalAnswers.isEmpty
        {

            result = optionalAnswers[index]
        }
        
        return result

    }

    
    /*private func popAnswer()->Answer
    {
        return answerStack.removeLast()
    }
    
    func pushMultiple(answer: String  )
    {
        answerStack.append(Answer.Multiple(answer))
    }
    
    
    func pushSingle(answer: NSDictionary )
    {
        answerStack.append(Answer.Single(answer))
    }
    
    func pushFreeText(index: Int)
    {
         if (isAnswered)
         {
         }
        
    }*/
    
    private func evaluate(answers: [Answer]) -> ( result: NSDictionary?, remainingAnswers: [Answer] )
    {
        if !answers.isEmpty
        {
            var remainingAnswers = answers
            let answer = remainingAnswers.removeLast()
            switch answer{
            case .Single (let a ):
                println("Single")
                
            case .Multiple:
                println("Multiple")
                
            case .FreeText:
                println("FreeText")
            
            }
        }
        
        return ( nil, answers)
    }

    private func performOperation(operation: Answer)
    {
        switch operation {
            
        case .Single:
            println("Single")
            
        case .Multiple:
            println("Multiple")
            
        case .FreeText:
            println("FreeText")
            
        }
    }
    
    }