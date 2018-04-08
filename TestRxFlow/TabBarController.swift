//
//  ViewController.swift
//  TestRxFlow
//
//  Created by Evan Roth on 4/6/18.
//

import UIKit

class TabBarController: UITabBarController {

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.installThirdTab()
	}
	
	func installThirdTab() {
		guard
			var newVCs = viewControllers,
			let thirdTabViewController = TabBarManager.thirdTabViewController
		else { fatalError() }
		
		newVCs.insert(thirdTabViewController, at: 2)
		viewControllers = newVCs
	}


}

