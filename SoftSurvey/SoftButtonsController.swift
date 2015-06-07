//
//  SoftuttonsController.swift
//  SoftSurvey
//
//  Created by shelley weiss on 5/26/15.
//  Copyright (c) 2015 shelley weiss. All rights reserved.
//


import UIKit
class SoftButtonsController:NSObject
{

    private var buttonsArray = [UIButton]()
    private weak var currentSelectedButton:UIButton? = nil
    override init()
    {
       
    }
    
    func addButton(aButton:UIButton)
    {
        buttonsArray.append(aButton)
        aButton.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        aButton.titleLabel!.textAlignment = .Left
    }
    
   
    
    func setButtonsArray(aButtonsArray:[UIButton])
    {
        for aButton in aButtonsArray
        {
            aButton.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        buttonsArray = aButtonsArray
    }
    
    func pressed(sender:UIButton)
    {
        if(sender.selected)
        {
            sender.selected = false
            currentSelectedButton = nil
        }
        else
        {
            for aButton in buttonsArray
            {
                if aButton != sender
                {
                    aButton.selected = false
                }
            }
            sender.selected = true
            currentSelectedButton = sender
        }
        
    }
    
    func selectedButton() ->UIButton?
    {
        return currentSelectedButton
    }
    


}