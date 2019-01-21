//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by Trinh Tong on 11/27/18.
//  Copyright © 2018 Trinh Tong. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}
