//
//  ViewController.swift
//  StoryboardObject
//
//  Created by Kostiantyn Koval on 23/07/15.
//  Copyright (c) 2015 Kostiantyn Koval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var fetch: UIButton!
  @IBOutlet weak var add: UIButton!
  @IBOutlet weak var log: UIButton!
    
  @IBAction func fetch(sender: UIButton) {
    println("\(__FUNCTION__)")
  }
  
  @IBAction func add(sender: UIButton) {
    println("\(__FUNCTION__)")
  }
  @IBAction func log(sender: UIButton) {
    println("\(__FUNCTION__)")
  }
}

