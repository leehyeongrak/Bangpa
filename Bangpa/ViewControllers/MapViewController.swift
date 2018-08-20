//
//  MapViewController.swift
//  Bangpa
//
//  Created by 이동건 on 20/08/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    static func initFromStoryboard() -> MapViewController{
        let storyboard = UIStoryboard(name: MapViewController.reusableIdentifier, bundle: nil)
        let mapViewController = storyboard.instantiateViewController(withIdentifier: MapViewController.reusableIdentifier) as! MapViewController
        return mapViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
