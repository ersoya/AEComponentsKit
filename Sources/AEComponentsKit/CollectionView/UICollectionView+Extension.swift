//
//  UICollectionView+Extension.swift
//
//
//  Created by Arda Ersoy on 21.12.2023.
//

import Foundation
import UIKit

public extension UICollectionView {

    func registerCell(for reuseIdentifier: String, in bundle: Bundle) {
        register(reuseIdentifier.nib(in: bundle), forCellWithReuseIdentifier: reuseIdentifier)
    }

    func registerHeader(for reuseIdentifier: String, in bundle: Bundle) {
        register(reuseIdentifier.nib(in: bundle), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifier)
    }

    func registerFooter(for reuseIdentifier: String, in bundle: Bundle) {
        register(reuseIdentifier.nib(in: bundle), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: reuseIdentifier)
    }

    func dequeuCell<T: UICollectionViewCell>(at indexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }

    func dequeuHeader<T: UICollectionReusableView>(at indexPath: IndexPath) -> T? {
        dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }

    func dequeuFooter<T: UICollectionReusableView>(at indexPath: IndexPath) -> T? {
        dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }
}

public extension UICollectionView {

    func reload() {
        reloadData()
    }
    
    func setEstimatedItemSize(_ size: CGSize) {
        let layout = collectionViewLayout as? UICollectionViewFlowLayout ?? UICollectionViewFlowLayout()
        layout.estimatedItemSize = size
        collectionViewLayout = layout
    }

    func setItemSize(_ size: CGSize) {
        let layout = collectionViewLayout as? UICollectionViewFlowLayout ?? UICollectionViewFlowLayout()
        layout.itemSize = size
        collectionViewLayout = layout
    }

    func setCompositionalLayout(layoutSize: NSCollectionLayoutSize,
                                headerHeight: NSCollectionLayoutDimension? = nil,
                                itemSpacing: CGFloat? = nil,
                                groupSpacing: CGFloat? = nil,
                                contentInsets: NSDirectionalEdgeInsets? = nil,
                                scrollDirection: ScrollDirection = .horizontal,
                                columnCount: Int? = nil) {
        let section = createLayoutSection(layoutSize: layoutSize, itemSpacing: itemSpacing, groupSpacing: groupSpacing, contentInsets: contentInsets, columnCount: columnCount)
        if let headerHeight = headerHeight {
            section.setSupplementaryHeader(heightDimension: headerHeight)
        }
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = scrollDirection

        let layout = UICollectionViewCompositionalLayout(section: section, configuration: configuration)
        setCollectionViewLayout(layout, animated: false)
    }
    
    func createLayoutSection(layoutSize: NSCollectionLayoutSize,
                             isHorizontal: Bool = true,
                             itemSpacing: CGFloat? = nil,
                             groupSpacing: CGFloat? = nil,
                             contentInsets: NSDirectionalEdgeInsets? = nil,
                             scrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior? = nil,
                             columnCount: Int? = nil) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: layoutSize.widthDimension.isEstimated ? layoutSize.widthDimension : .fractionalWidth(1.0 / (CGFloat(columnCount ?? 1))),
            heightDimension: isHorizontal ? layoutSize.heightDimension : .fractionalHeight(0.5))
        )
        
        var group: NSCollectionLayoutGroup
        if isHorizontal {
            group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitems: [item])
        } else {
            group = NSCollectionLayoutGroup.vertical(layoutSize: layoutSize, subitems: [item])
        }
        
        if let itemSpacing = itemSpacing {
            group.interItemSpacing = .fixed(itemSpacing)
        }
        
        let section = NSCollectionLayoutSection(group: group)
        if let groupSpacing = groupSpacing {
            section.interGroupSpacing = groupSpacing
        }
        
        section.contentInsets = contentInsets ?? .init(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)
        section.orthogonalScrollingBehavior = scrollingBehavior ?? .none
        
        return section
    }
}

public extension NSCollectionLayoutSection {
    
    func setSupplementaryHeader(heightDimension: NSCollectionLayoutDimension) {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: heightDimension)
        let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
        )
        boundarySupplementaryItems = [supplementaryItem]
    }
}
