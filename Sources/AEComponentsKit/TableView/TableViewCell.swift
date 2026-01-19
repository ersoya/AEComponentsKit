//
//  TableViewCell.swift
//  AEComponentsKit
//
//  Created by Arda Ersoy on 13.01.2026.
//

import Foundation
import UIKit
import Combine

open class TableViewCell: UITableViewCell {

    public var cancellables = Set<AnyCancellable>()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        addObservables()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setupSubviews()
        addObservables()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        cancellables = []
        addObservables()
    }
    
    open func setupSubviews() {
        selectionStyle = .none
    }
    
    open func addObservables() {}
}
