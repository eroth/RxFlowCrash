//
//  RxTabFlow.swift
//  RxFlowTab
//
//  Created by Evan Roth on 4/7/18.
//  Copyright © 2018 Evan Roth. All rights reserved.
//

import Foundation
import RxFlow

public class ThirdTabFlow {
	private let rootViewController: UISplitViewController
	private let splitViewMasterNavController = UINavigationController()
	
	public init() {
		rootViewController = UISplitViewController()
		let thirdTabBarItem = UITabBarItem(title: "RxFlowTab", image: nil, selectedImage: nil)
		rootViewController.tabBarItem = thirdTabBarItem
		rootViewController.viewControllers = [splitViewMasterNavController]
	}
	
	private func navigateToFirstVC() -> NextFlowItems {
		let storyboard = UIStoryboard(name: "ThirdTab", bundle: Bundle(for: RxViewController.self))
		guard let viewController = storyboard.instantiateViewController(withIdentifier: "RxViewController") as? RxViewController else { fatalError() }
		splitViewMasterNavController.pushViewController(viewController, animated: false)
		
		return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewController))
	}
}

extension ThirdTabFlow: Flow {
	public func navigate(to step: Step) -> NextFlowItems {
		guard let step = step as? ThirdTabStep else { return NextFlowItems.none }
		
		switch step {
		case .firstVC:
			return navigateToFirstVC()
		}
	}
	
	public var root: Presentable {
		return rootViewController
	}
}

public class ThirdTabStepper: Stepper, HasDisposeBag {
	public init() {
		step.accept(ThirdTabStep.firstVC)
	}
}
