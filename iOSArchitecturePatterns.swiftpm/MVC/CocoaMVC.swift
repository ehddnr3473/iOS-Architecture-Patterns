//
//  CocoaMVC.swift
//  
//
//  Created by 김동욱 on 2022/12/15.
//

import UIKit
import Foundation

/// Model object
struct Counter {
    var number: Int
    
    mutating func increase() {
        number += 1
    }
}

/// View + Controller object
class CounterViewController: UIViewController {
    var counter: Counter!
    // UI Component
    let numberLabel = UILabel()
    let increaseNumberButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        increaseNumberButton.addTarget(self, action: #selector(touchUpButton), for: .touchUpInside)
        // set up a layout & configure
    }
    
    @objc func touchUpButton() {
        counter.increase()
        numberLabel.text = String(counter.number)
    }
}

let model = Counter(number: 0)
let view = CounterViewController()
view.counter = model
