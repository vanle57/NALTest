//
//  MainViewController.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }

    private func configNavigationBar() {
        let menuBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-menu"), style: .plain, target: self, action: #selector(menuButtonTouchUpInside))
        navigationItem.leftBarButtonItem = menuBarButtonItem
    }

    @objc func menuButtonTouchUpInside() { }
}
