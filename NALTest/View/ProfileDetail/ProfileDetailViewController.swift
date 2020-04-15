//
//  ProfileDetailViewController.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import UIKit

final class ProfileDetailViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    /*
        Info
     **/
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    /*
        About
     **/
    @IBOutlet weak var bioLabel: UILabel!

    /*
        Stats
     **/
    @IBOutlet weak var numberOfRepoLabel: UILabel!
    @IBOutlet weak var numberOfFollowerLabel: UILabel!
    @IBOutlet weak var numberOfFollowingLabel: UILabel!
    private let refreshControl = UIRefreshControl()

    var viewModel: ProfileDetailViewModel = ProfileDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        configScrollView()
        if AppDelegate.shared.isNetworkConnectionAvailable() {
            getProfile()
        } else {
            fetchProfile()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }

    private func configScrollView() {
        if #available(iOS 10.0, *) {
            scrollView.refreshControl = refreshControl
        } else {
            scrollView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(getProfile), for: .valueChanged)
    }

    private func updateUI() {
        avatarImageView.setImage(url: viewModel.user.avatarUrl)
        usernameLabel.text = viewModel.user.username
        locationLabel.text = viewModel.user.location
        bioLabel.text = viewModel.user.bio
        numberOfRepoLabel.text = viewModel.user.numberOfRepos.toString()
        numberOfFollowerLabel.text = viewModel.user.numberOfFollowers.toString()
        numberOfFollowingLabel.text = viewModel.user.numberOfFollowing.toString()
    }

    @objc private func getProfile() {
        viewModel.getProfile { [weak self] (result) in
            switch result {
            case .success:
                self?.updateUI()
                self?.refreshControl.endRefreshing()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func fetchProfile() {
        viewModel.fetchProfile { [weak self] (result) in
            switch result {
            case .success:
                self?.updateUI()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
