//
//  Node.swift
//  SoftSurvey
//
//  Created by shelley weiss on 3/26/15.
//  Copyright (c) 2015 shelley weiss. All rights reserved.
//



import UIKit

class Node<T:SoftQuestion> {
    var value: T? = nil
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    init() {
    }
    
    init(value: T) {
        self.value = value
    }
   

}
