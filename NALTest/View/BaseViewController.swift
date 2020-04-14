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
        switch self {
        case is UserListViewController:
            configLeftBar()
        case is ProfileDetailViewController:
            configBackButtonItem()
        default:
            break
        }
    }

    private func configLeftBar() {
        let image = #imageLiteral(resourceName: "ic-menu").withRenderingMode(.alwaysTemplate)
        let menuButton = UIButton(type: .custom)
        menuButton.setImage(image, for: .normal)
        menuButton.imageView?.tintColor = .black
        menuButton.addTarget(self, action: #selector(menuButtonTouchUpInside), for: .touchUpInside)
        let menuBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.leftBarButtonItem = menuBarButtonItem
    }

    private func configBackButtonItem() {
        let image = #imageLiteral(resourceName: "ic-back").withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(image, for: .normal)
        backButton.imageView?.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTouchUpInside), for: .touchUpInside)
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backBarButtonItem
    }

    @objc func menuButtonTouchUpInside() { }

    @objc func backButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
}
