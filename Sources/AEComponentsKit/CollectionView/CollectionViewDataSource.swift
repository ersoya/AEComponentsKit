//
//  CollectionViewDataSource.swift
//
//
//  Created by Arda Ersoy on 21.12.2023.
//

import Foundation
import UIKit

public class CollectionViewDataSource: NSObject {

    // MARK: Properties
    private let cell: CollectionViewCellProtocol
    private let header: CollectionViewHeaderProtocol?
    private let footer: CollectionViewFooterProtocol?
    private let display: CollectionViewDisplayProtocol?

    // MARK: Initializer
    public init(cell: CollectionViewCellProtocol,
                header: CollectionViewHeaderProtocol? = nil,
                footer: CollectionViewFooterProtocol? = nil,
                display: CollectionViewDisplayProtocol? = nil) {
        self.cell = cell
        self.header = header
        self.footer = footer
        self.display = display
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionViewDataSource: UICollectionViewDataSource {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        cell.numberOfSections()
    }
    
    public func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cell.numberOfItems(in: section)
    }

    public func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cell.cellForItem(at: indexPath) else {
            return .init()
        }
        return cell
    }

    public func collectionView(_: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = header?.headerView(for: indexPath) else {
                return .init()
            }
            return header
        case UICollectionView.elementKindSectionFooter:
            guard let footer = footer?.footerView(for: indexPath) else {
                return .init()
            }
            return footer
        default:
            return .init()
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension CollectionViewDataSource: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    public func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cell.didSelectItem(at: indexPath)
    }

    public func collectionView(_: UICollectionView, willDisplay _: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        display?.willDisplay(for: indexPath)
    }
}
