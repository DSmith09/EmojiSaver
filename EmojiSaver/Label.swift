//
//  Label.swift
//  EmojiSaver
//
//  Created by Smith, David X. on 12/5/18.
//  Copyright © 2018 dmsmith. All rights reserved.
//

import AppKit

final class Label: NSTextField {
    
    // MARK: Initialization
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        isBezeled = false
        isSelectable = false
        drawsBackground = false
    }
}
