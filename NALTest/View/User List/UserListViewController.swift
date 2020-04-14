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
    private let refreshControl = UIRefreshControl()

    var viewModel: UserListViewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User List"
        configTableView()
        getUsers()
    }

    private func configTableView() {
        let cellNib = UINib(nibName: "UserListCell", bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: "UserListCell")
        tableView.rowHeight = 105

        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(getUsers), for: .valueChanged)
    }

    @objc private func getUsers() {
        viewModel.getUsers { [weak self] (result) in
            switch result {
            case .success:
                self?.tableView.reloadData()
                self?.refreshControl.endRefreshing()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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

// MARK: - UITableViewDelegate
extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel.viewModelForProfile(at: indexPath) else { return }
        let vc = ProfileDetailViewController()
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
}
