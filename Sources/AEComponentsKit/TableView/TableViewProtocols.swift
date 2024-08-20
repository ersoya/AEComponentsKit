//
//  TableViewProtocols.swift
//  
//
//  Created by Arda Ersoy on 20.08.2024.
//

import Foundation
import UIKit

public protocol TableViewCellProtocol: AnyObject {
    func numberOfSections() -> Int
    
    func numberOfItems(in section: Int, tableView: UITableView) -> Int
    func cellForItem(at indexPath: IndexPath, tableView: UITableView) -> UITableViewCell?
    func didSelectItem(at indexPath: IndexPath, tableView: UITableView)
}

public extension TableViewCellProtocol {
    
    func numberOfSections() -> Int {
        1
    }
    
    func didSelectItem(at indexPath: IndexPath, tableView: UITableView) {
        
    }
}

public protocol TableViewHeaderProtocol: AnyObject {
    func headerView(in section: Int) -> UIView?
}

public protocol TableViewScrollProtocol: AnyObject {
    func didScroll(to offset: CGFloat)
    func didEndDecelerating(_ scrollView: UIScrollView)
}

public extension TableViewScrollProtocol {
    
    func didScroll(to offset: CGFloat) {
        
    }
    
    func didEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}

public protocol TableViewFooterProtocol: AnyObject {
    func footerView(in section: Int) -> UIView?
}

public protocol TableViewDisplayProtocol: AnyObject {
    func willDisplay(for indexPath: IndexPath)
    func didEndDisplaying(for indexPath: IndexPath)
}

public extension TableViewDisplayProtocol {
    
    func didEndDisplaying(for indexPath: IndexPath) {
        
    }
}
