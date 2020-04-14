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

    var viewModel: UserListViewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User List"
    }

    private func configTableView() {
        let cellNib = UINib(nibName: "UserListCell", bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: "UserListCell")
    }
}

// MARK: - UITableViewDataSource
extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCell") as? UserListCell,
            let viewModel = viewModel.viewModelForCellViewModel(at: indexPath)
            else { return UITableViewCell() }
        cell.viewModel = viewModel
        return cell
    }
}
