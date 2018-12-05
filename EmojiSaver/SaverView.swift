//
//  SaverView.swift
//  EmojiSaver
//
//  Created by Smith, David X. on 12/5/18.
//  Copyright © 2018 dmsmith. All rights reserved.
//

import ScreenSaver

final class SaverView: ScreenSaverView {
    
    // MARK: Properties
    fileprivate lazy var emojiLabel: Label = {
        let label = Label()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Initialization
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        configure()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        configure()
    }
    
    // MARK: Configuration
    private func configure() {
        animationTimeInterval = 1
        addSubviews()
        defineConstraints()
        setupSubviews()
    }
    
    // MARK: Overrides
    override func animateOneFrame() {
        super.animateOneFrame()
        updateContent()
    }
}

private extension SaverView {
    
    func addSubviews() {
        addSubview(emojiLabel)
    }
    
    func defineConstraints() {
        let xConstraint = emojiLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        let yConstraint = emojiLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate( [xConstraint, yConstraint])
    }
    
    func setupSubviews() {
        emojiLabel.font = NSFont.systemFont(ofSize: bounds.height/5)
    }
    
    func updateContent() {
        guard let emoji = String.randomEmoji else { return }
        emojiLabel.stringValue = emoji
    }
}

private extension String {
    static var randomEmoji: String? {
        guard let randomEmojiAscii = UInt32.random(from: 0x1F601, to: 0x1F64F) else { return nil }
        return UnicodeScalar(randomEmojiAscii)?.description
    }
}

private extension UInt32 {
    static func random(from start: UInt32, to end: UInt32) -> UInt32? {
        return UInt32(arc4random_uniform(UInt32(end - start + 1))) + start
    }
}
