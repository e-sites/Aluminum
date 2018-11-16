![Aluminum](Assets/Logo.png)

Aluminum is part of the **[E-sites iOS Suite](https://github.com/e-sites/iOS-Suite)**.

---

Applying the [robot pattern](https://medium.com/capital-one-tech/robot-pattern-testing-for-xcuitest-4c2f0c40b4ad) to your UI XCTests.   
*Special thanks to [Rob Whitaker](https://medium.com/@r.whitaker?source=post_header_lockup).*

[![forthebadge](http://forthebadge.com/images/badges/made-with-swift.svg)](http://forthebadge.com) [![forthebadge](http://forthebadge.com/images/badges/built-with-swag.svg)](http://forthebadge.com)

[![Platform](https://img.shields.io/cocoapods/p/Aluminum.svg?style=flat)](http://cocoadocs.org/docsets/Aluminum)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Aluminum.svg)](https://cocoapods.org/pods/Aluminum)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Travis-ci](https://travis-ci.com/e-sites/Aluminium.svg?branch=master)](https://travis-ci.com/e-sites/Aluminum)


# Installation

Podfile:

```ruby
target 'YourUITestTarget' do
    pod 'Aluminum'
end
```

And then

```
pod install
```

# Implementation

## Create your robots
```swift
import Foundation
import XCTest
import Aluminum

class WelcomeRobot: Aluminum.Robot {
	lazy var startButton = app.buttons["WelcomeStartButton"]

    override func requiredElements() -> [XCUIElement] {
        return [ startButton ]
    }

    @discardableResult
    func openList() -> ListRobot {
        startButton()
        return ListRobot(app: app)
    }
}

class ListRobot: Aluminum.Robot {
	lazy var cell0 = app.cells["Cell0"]

    override func requiredElements() -> [XCUIElement] {
        return [ cell0 ]
    }

    @discardableResult
    func openDetail() -> DetailRobot {
        cell0.tap()
        return DetailRobot(app: app, parent: self)
    }
}

class DetailRobot: Aluminum.Robot, Aluminum.NavigableRobot {
	lazy var titleLabel = app.staticTexts["DetailTitleLabel"]
	
    var parent: ListRobot!

    required convenience init(app: XCUIApplication, parent: ListRobot) {
        self.init(app: app)
        self.parent = parent
    }

    override func requiredElements() -> [XCUIElement] {
        return [ titleLabel ]
    }
    
	@discardableResult
	func checkTitle() -> DetailRobot {
		XCTAssertEqual(titleLabel.label, "Desired text")
	}
}
```
## Run the test

```swift
func testUI() {
	let app = XCUIApplication()
	
	WelcomeRobot(app: app)
	.openList()
	.openDetail()
	.checkTitle()
}

```