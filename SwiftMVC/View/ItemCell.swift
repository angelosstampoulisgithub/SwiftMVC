//
//  ItemCell.swift
//  SwiftMVC
//
//  Created by Angelos Staboulis on 2/2/26.
//

import Foundation
import UIKit

final class ItemCell: UITableViewCell {
    static let reuseID = "ItemCell"

    func configure(with item: Item) {
        textLabel?.text = item.title
        detailTextLabel?.text = item.subtitle
    }
}
