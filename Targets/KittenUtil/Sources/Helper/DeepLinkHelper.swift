//
//  DeepLinkHelper.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/19/24.
//

import Foundation
import UIKit

class DeepLinkHelper {
    static func openLoginResume() {
        if let url = URL(string: "kitten://login/resume"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
