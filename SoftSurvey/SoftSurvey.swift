//
//  SoftSurvey.swift
//  SoftSurvey
//
//  Created by shelley weiss on 3/26/15.
//  Copyright (c) 2015 shelley weiss. All rights reserved.
//


import UIKit

class SoftSurvey<T:SoftQuestion> {
    var count: Int = 0
    var head: Node<T> = Node<T>()
    var tail: Node<T> = Node<T>()
    
    init() {
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func enqueue(value: T) {
        var node = Node<T>(value: value)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.next = self.head
            self.head.prev = node
            self.head = node
        }
        self.count++
    }
    
    func dequeue() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.count == 1 {
            var temp: Node<T> = self.tail
            self.count--
            return temp.value
        } else {
            var temp: Node<T> = self.tail
            self.tail = self.tail.prev!
            self.count--
            return temp.value
        }
    }

    func upload() -> String? {
       
      
        let path = NSBundle.mainBundle().pathForResource("jsonData", ofType: "json")
        let jsonData = NSData(contentsOfMappedFile: path!)
        
 
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        var soft : NSArray = jsonResult["softQuestion"] as! NSArray
        
        //traditional C-style
        for var index = 0; index < soft.count; ++index {
            
            if let question: AnyObject = ((soft)[index] as? NSDictionary)?["question"]             {
                var softnode = T(value: index+1 as Int, text: question as! String)
                //enqueue(softnode)
                if let answerArray: NSArray = (((soft)[index] as? NSDictionary)?["answer"] as? NSArray)
                {
                    for item in answerArray { // loop through data items
                        let obj = item as! NSDictionary
                        
                        for (key, value) in obj
                        {
                            softnode.pushAnswer(value as! String)
                           
                            // softnode.pushMultiple(value as String)
                            
                        }
                       
                    }
                    
                }
                else
                {
                    //println("none")

                }
                enqueue(softnode)
            }
            
            
        }
        
        return nil
     
    }
   





};