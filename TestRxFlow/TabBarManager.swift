//
//  TabBarManager.swift
//  TestRxFlow
//
//  Created by Evan Roth on 4/7/18.
//

import Foundation
import UIKit
import RxFlow
import RxFlowTab

class TabBarManager {
	static var thirdTabViewController: UIViewController? = {
		return thirdTabFlow.root as? UIViewController
	}()
	
	static private var thirdTabCoordinator = Coordinator()
	
	static var thirdTabFlow: ThirdTabFlow = {
		let thirdTabFlow = ThirdTabFlow()
		let thirdTabStepper = ThirdTabStepper()
		TabBarManager.thirdTabCoordinator.coordinate(flow: thirdTabFlow, withStepper: thirdTabStepper)
		
		return thirdTabFlow
	}()
	
	
}
