//
//  TableViewDataSource.swift
//  
//
//  Created by Arda Ersoy on 20.08.2024.
//

import Foundation
import UIKit

public class TableViewDataSource: NSObject {

    // MARK: Properties
    private let cell: TableViewCellProtocol
    private let header: TableViewHeaderProtocol?
    private let footer: TableViewFooterProtocol?
    private let scroll: TableViewScrollProtocol?
    private let display: TableViewDisplayProtocol?

    // MARK: Initializer
    public init(cell: TableViewCellProtocol,
                header: TableViewHeaderProtocol? = nil,
                footer: TableViewFooterProtocol? = nil,
                scroll: TableViewScrollProtocol? = nil,
                display: TableViewDisplayProtocol? = nil) {
        self.cell = cell
        self.header = header
        self.footer = footer
        self.scroll = scroll
        self.display = display
    }
}

// MARK: - UITableViewDataSource
extension TableViewDataSource: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        cell.numberOfSections()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cell.numberOfItems(in: section, tableView: tableView)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = cell.cellForItem(at: indexPath, tableView: tableView) else {
            return .init()
        }
        return cell
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = header?.headerView(in: section) else {
            return .init()
        }
        return header
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = footer?.footerView(in: section) else {
            return .init()
        }
        return footer
    }
}

// MARK: - UITableViewDelegate
extension TableViewDataSource: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cell.didSelectItem(at: indexPath, tableView: tableView)
    }

    public func tableView(_: UITableView, willDisplay _: UITableViewCell, forRowAt indexPath: IndexPath) {
        display?.willDisplay(for: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        display?.didEndDisplaying(for: indexPath)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scroll?.didScroll(to: scrollView.contentOffset.y)
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scroll?.didEndDecelerating(scrollView)
    }
}
