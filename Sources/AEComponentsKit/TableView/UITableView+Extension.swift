//
//  UITableView+Extension.swift
//
//
//  Created by Arda Ersoy on 20.08.2024.
//

import Foundation
import UIKit

public extension UITableView {

    func registerCell<T: UITableViewCell>(for cell: T.Type) {
        register(cell.self, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    func registerCell(for reuseIdentifier: String, in bundle: Bundle) {
        register(reuseIdentifier.nib(in: bundle), forCellReuseIdentifier: reuseIdentifier)
    }

    func dequeuCell<T: UITableViewCell>(at indexPath: IndexPath) -> T? {
        dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }
}

public extension UITableView {
    
    func reload() {
        reloadData()
    }
}
