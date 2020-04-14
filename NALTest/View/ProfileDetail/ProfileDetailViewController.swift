//
//  ProfileDetailViewController.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import UIKit

class ProfileDetailViewController: BaseViewController {

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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
