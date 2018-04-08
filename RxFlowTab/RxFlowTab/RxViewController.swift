//
//  RxViewController.swift
//  RxFlowTab
//
//  Created by Evan Roth on 4/7/18.
//  Copyright © 2018 Evan Roth. All rights reserved.
//

import UIKit
import RxFlow
import RxSwift

class RxViewController: UIViewController, Stepper {
	@IBOutlet fileprivate weak var tableView: UITableView!
	
	private let items: Observable<[[String: String]]> = {
		return Observable.just([
			["content": "First Cell"],
			["content": "Second Cell"],
			["content": "Third Cell"]
		])
	}()
	
	private let disposeBag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let cellType = RxTableViewCell.self
		let cellIdentifier = String(describing: cellType)
		
		// This causes a crash if I return the `one` case in `NextFlowItems` in `ThirdTabFlow`; if I return `NextFlowItems.none` it works
//		let bundle = Bundle(for: type(of: self))
		let bundle = Bundle(for: cellType) // This always works
		
		let cellNib = UINib(nibName: cellIdentifier, bundle: bundle)
		
		tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
		
		items.asDriver(onErrorJustReturn: [])
			.drive(tableView.rx.items(cellIdentifier: cellIdentifier, cellType: cellType)) { (_, viewModel, cell) in
				cell.configure(with: viewModel)
			}
			.disposed(by: disposeBag)
	}
}
