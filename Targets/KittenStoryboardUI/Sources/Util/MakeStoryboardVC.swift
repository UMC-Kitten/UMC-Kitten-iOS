//
//  MakeStoryboardVC.swift
//  Kitten
//
//  Created by DOYEON LEE on 3/7/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import UIKit

public final class MakeStoryboardVC {
    public static let make: (String, String) -> UIViewController = { storyboardName, identifier in
        let storyboard = UIStoryboard(name: storyboardName, bundle: KittenStoryboardUIResources.bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        return vc
    }
}
