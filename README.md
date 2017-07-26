![][logo-image]Shadow View 
----------
----------
> Shadow makes view's shadow implementation easy and sweet.

[![Swift Version][swift-image]][swift-url] [![Build Status][travis-image]][travis-url] [![License][license-image]][license-url] [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)   [![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/ShadowView)

----------

Add simple shadows to add a gaussian blurred projection (as a shadow) to any **UIView**.

![][example-image]

## Features

- [x] Add shadow easily from the **storyboard** and **programmatically**.
- [x] Add a gaussian blurred projection of your view (like iOS 10 music app).
- [x] Customize the border width and border color of any view from storyboard .

## Requirements

- iOS 9.0+
- Xcode 8

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `ShadowView` by adding it to your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
pod 'ShadowView'
end
```

To get the full benefits import `ShadowView` wherever you import UIKit

``` swift
import UIKit
import ShadowView
```
#### Manually
1. Download and drop all files in *shadowView* directory in your project.  
2. Nice Job!  

## Usage example

```swift
import EZSwiftExtensions
ez.detectScreenShot { () -> () in
print("User took a screen shot")
}
```

## Contribute

We would love you for the contribution to **ShadowView**, check the ``LICENSE`` file for more info.

## Meta

Pierre Perrin – pierreperrin@outlook.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/PierrePerrin/](https://github.com/dbader/)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
[logo-image]: <img src=https://github.com/PierrePerrin/ShadowView/raw/master/Ressources/ShadowLogoText.png width="200" height="400">
[example-image]: https://github.com/PierrePerrin/ShadowView/raw/master/Ressources/Example.png



