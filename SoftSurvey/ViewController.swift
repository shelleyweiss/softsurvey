//
//  ViewController.swift
//  SoftSurvey
//
//  Created by shelley weiss on 3/4/15.
//  Copyright (c) 2015 shelley weiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate
{
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var scrollContainerView: UIView?

    var vcCount:Int = 0{
        didSet{
            navigationItem.title = "Count: \(vcCount)"
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       // topicsImages = [UIImage(named: "topics1s.png")!]
    }

    override func didReceiveMemoryWarning()
    {
        
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        
        super.viewWillAppear(animated)
        
    }
    

    

  

}

