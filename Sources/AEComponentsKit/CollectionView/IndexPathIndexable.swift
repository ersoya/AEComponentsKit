//
//  IndexPathIndexable.swift
//
//
//  Created by Arda Ersoy on 21.12.2023.
//

import Foundation

public protocol IndexPathIndexable {
    associatedtype ItemType

    func item(at indexPath: IndexPath) -> ItemType
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
}

extension Array: IndexPathIndexable {

    public func item(at indexPath: IndexPath) -> Element {
        self[indexPath.row]
    }

    public func numberOfSections() -> Int {
        1
    }

    public func numberOfItems(in _: Int) -> Int {
        count
    }
}
