//
//  RxTableViewCell.swift
//  RxFlowTab
//
//  Created by Evan Roth on 4/8/18.
//  Copyright © 2018 Evan Roth. All rights reserved.
//

import UIKit

class RxTableViewCell: UITableViewCell {
	@IBOutlet weak var contentLabel: UILabel!
	
	func configure(with model: [String: String]) {
		contentLabel.text = model["content"]
	}
    
}
