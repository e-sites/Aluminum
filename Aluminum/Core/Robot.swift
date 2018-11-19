//
//  Robot.swift
//  MedicPlannerSnapshot
//
//  Created by Bas van Kuijck on 16/11/2018.
//  Copyright © 2018 E-sites. All rights reserved.
//

import Foundation
import XCTest

public protocol Robotable {
    var app: XCUIApplication { get }
}

open class Robot: Robotable {
    public let app: XCUIApplication

    public init(app: XCUIApplication) {
        self.app = app
        assertExists(requiredElements())
    }

    open func requiredElements() -> [XCUIElement] {
        return []
    }

    open func assertExists(_ elements: [XCUIElement], timeout: TimeInterval = 5) {
        for element in elements {
            assertExists(element)
        }
    }

    open func assertExists(_ element: XCUIElement, timeout: TimeInterval = 5) {
        let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == true"), object: element)
        if XCTWaiter.wait(for: [expectation], timeout: timeout) != .completed {
            XCTAssert(false, "Element '\(element.identifier)' does not exist")
        }
    }

    @discardableResult
    public func sleep(`for` interval: TimeInterval) -> Self {
        Thread.sleep(forTimeInterval: interval)
        return self
    }
}
