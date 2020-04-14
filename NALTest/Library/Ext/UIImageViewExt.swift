//
//  UIImageViewExt.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import UIKit.UIImageView
import Kingfisher

extension UIImageView {
    func setImage(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        self.kf.setImage(with: url)
    }
}
