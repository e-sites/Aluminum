//
//  NavigableRobot.swift
//  MedicPlannerSnapshot
//
//  Created by Bas van Kuijck on 16/11/2018.
//  Copyright © 2018 E-sites. All rights reserved.
//

import Foundation
import XCTest

public protocol NavigableRobot {
    associatedtype Parent: Robotable
    var parent: Parent! { get }

    init(app: XCUIApplication, parent: Parent)
    func goBack() -> Parent
}

public extension NavigableRobot where Self: Robot {
    private var navigationBarBackButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 0)
    }

    @discardableResult
    public func goBack() -> Parent {
        navigationBarBackButton.tap()
        return parent
    }
}
