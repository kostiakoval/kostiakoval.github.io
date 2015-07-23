//
//  Controller.swift
//  StoryboardObject
//
//  Created by Kostiantyn Koval on 23/07/15.
//  Copyright (c) 2015 Kostiantyn Koval. All rights reserved.
//

import UIKit

class Controller : NSObject {
  
  @IBOutlet weak var one: UIButton!
  @IBOutlet weak var two: UIButton!
  @IBOutlet weak var three: UIButton!
  
  @IBAction func one(sender: UIButton) {
    println("\(__FUNCTION__)")
  }
  
  @IBAction func two(sender: UIButton) {
    println("\(__FUNCTION__)")
  }
  @IBAction func three(sender: UIButton) {
    println("\(__FUNCTION__)")
  }
  
  override init() {
    println("\(__FUNCTION__)")
  }
  
  deinit {
    println("\(__FUNCTION__)")
  }
}
