//
//  MVP.swift
//  
//
//  Created by 김동욱 on 2022/12/15.
//

import UIKit
import Foundation

/// Model
struct Counter {
    var number: Int
    
    mutating func increase() -> Int {
        number += 1
        return number
    }
}

protocol CountingViewPresenter {
    init(_ view: CountingView, _ model: Counter)
    func increase()
}

protocol CountingView: AnyObject {
    func setIncreasedNumber(number: Int)
}

class CountingPresenter: CountingViewPresenter {
    unowned let view: CountingView
    var model: Counter
    
    required init(_ view: CountingView, _ model: Counter) {
        self.view = view
        self.model = model
    }
    
    func increase() {
        view.setIncreasedNumber(number: model.increase())
    }
}


class CountingViewController: UIViewController, CountingView {
    var presenter: CountingPresenter!
    let numberLabel = UILabel()
    let increaseNumberButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        increaseNumberButton.addTarget(self, action: #selector(touchUpButton), for: .touchUpInside)
        // set up a layout & configure
    }
    
    @objc func touchUpButton() {
        presenter.increase()
    }
    
    func setIncreasedNumber(number: Int) {
        numberLabel.text = String(number)
    }
}

// Assemling of MVP
let view = CountingViewController()
let model = Counter(number: 0)
let presenter = CountingPresenter(view, model)
view.presenter = presenter


