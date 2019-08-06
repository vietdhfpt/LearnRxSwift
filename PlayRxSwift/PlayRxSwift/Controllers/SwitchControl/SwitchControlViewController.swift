//
//  SwitchControlViewController.swift
//  PlayRxSwift
//
//  Created by Do Hoang Viet on 8/5/19.
//  Copyright © 2019 Do Hoang Viet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SwitchControlViewController: UIViewController {

    @IBOutlet weak var toggleSwitch: UISwitch!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        toggleSwitch.rx.isOn.subscribe(onNext: { enable in
            print(enable ? "It is on" : "It is off")
        })
            .disposed(by: disposeBag)
    }
}

