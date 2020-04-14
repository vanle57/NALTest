//
//  UserListViewController.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import UIKit

class UserListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User List"
    }
}
