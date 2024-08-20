//
//  UIView+Extension.swift
//
//
//  Created by Arda Ersoy on 20.08.2024.
//

import Foundation
import UIKit

public extension UIView {
    
    func commonInit(in bunle: Bundle) {
        guard let view = loadViewFromNib(in: bunle) else { return }
        view.frame = bounds
        addSubview(view)
    }
    
    func loadViewFromNib(in bundle: Bundle) -> UIView? {
        let identifier = String(describing: type(of: self))
        let nib = UINib(nibName: identifier, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
