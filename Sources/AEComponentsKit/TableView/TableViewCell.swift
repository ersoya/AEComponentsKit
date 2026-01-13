//
//  TableViewCell.swift
//  AEComponentsKit
//
//  Created by Arda Ersoy on 13.01.2026.
//

import UIKit
import Combine

open class TableViewCell: UITableViewCell {

    public var cancellables = Set<AnyCancellable>()

    open override func awakeFromNib() {
        super.awakeFromNib()
        setupSubviews()
        setupConstraints()
        addObservables()
    }

    open func setupSubviews() {}
    
    open func setupConstraints() {}

    open func addObservables() {}

    open override func prepareForReuse() {
        super.prepareForReuse()
        cancellables = []
        addObservables()
    }
}
