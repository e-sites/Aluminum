//
//  XCUIElement+extensions.swift
//  Aluminum
//
//  Created by Bas van Kuijck on 19/11/2018.
//  Copyright © 2018 E-sites. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    public func scrollToElement(element: XCUIElement, timeout: TimeInterval = 10) {
        let until = CFAbsoluteTimeGetCurrent() + timeout
        _scrollToElement(element: element, until: until)
    }

    private func _scrollToElement(element: XCUIElement, until: TimeInterval) {
        while !element._isVisible() {
            if CFAbsoluteTimeGetCurrent() > until {
                XCTAssert(false, "Element '\(element.identifier)' cannot be scrolled to")
                return
            }
            swipeUp()
        }
    }

    private func _isVisible() -> Bool {
        guard self.exists && !self.frame.isEmpty else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }

    public func tap(at point: CGPoint) {
        if point == .zero {
            tap()
            return
        }
        let normalized = self.coordinate(withNormalizedOffset: CGVector.zero)
        let coordinate = normalized.withOffset(CGVector(dx: point.x, dy: point.y))
        coordinate.tap()
    }
}
