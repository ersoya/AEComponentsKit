//
//  IdentifierReusable.swift
//
//
//  Created by Arda Ersoy on 21.12.2023.
//

import Foundation
import UIKit

public protocol IdentifierReusable {
    static var reuseIdentifier: String { get }
}

public extension IdentifierReusable {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}

extension UICollectionReusableView: IdentifierReusable {}

public extension UICollectionReusableView {
    static func nib(in bundle: Bundle) -> UINib {
        UINib(nibName: Self.reuseIdentifier, bundle: bundle)
    }
}

public extension String {
    func nib(in bundle: Bundle) -> UINib {
        UINib(nibName: self, bundle: bundle)
    }
}
