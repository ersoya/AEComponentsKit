//
//  CollectionViewProtocols.swift
//
//
//  Created by Arda Ersoy on 21.12.2023.
//

import Foundation
import UIKit

public protocol CollectionViewCellProtocol: AnyObject {
    func numberOfSections() -> Int
    
    func numberOfItems(in section: Int, collectionView: UICollectionView) -> Int
    func cellForItem(at indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell?
    func didSelectItem(at indexPath: IndexPath, collectionView: UICollectionView)
}

public extension CollectionViewCellProtocol {
    
    func numberOfSections() -> Int {
        1
    }
    
    func didSelectItem(at indexPath: IndexPath, collectionView: UICollectionView) {
        
    }
}

public protocol CollectionViewHeaderProtocol: AnyObject {
    func headerView(for indexPath: IndexPath) -> UICollectionReusableView?
}

public protocol CollectionViewScrollProtocol: AnyObject {
    func didScroll(to offset: CGFloat)
}

public protocol CollectionViewFooterProtocol: AnyObject {
    func footerView(for indexPath: IndexPath) -> UICollectionReusableView?
}

public protocol CollectionViewDisplayProtocol: AnyObject {
    func willDisplay(for indexPath: IndexPath)
}
