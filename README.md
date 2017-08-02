<img src=https://github.com/PierrePerrin/ShadowView/raw/master/Ressources/ShadowLogoText.png height="100"/>

> ShadowView is an iOS Shadow library that makes view's shadow implementation easy and sweet 🎉 🎊.

[![Swift Version][swift-image]][swift-url] [![Build Status][travis-image]][travis-url] [![License][license-image]][license-url] [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)   [![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/ShadowView)

----------

Add simple shadows to add a gaussian blurred projection (as a shadow) to any **UIView**.

![][example-image]
## Table of contents
<!-- TOC depthFrom:2 depthTo:4 withLinks:1 updateOnSave:1 orderedList:0 -->
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
  - [CocoaPods](#cocoaPods)
  - [Manually](#manually)
- [How it works](#how-it-works)
  - [Normal Shadows](#normal-shadows)
  - [Projected Gaussian Shadows](#projected-gaussian-shadows)
- [Usage example](#usage-example)
  - [With Storyboard](#with-storyboard)
  - [Programmatically](#programmatically)
- [Parameters](#parameters)
- [Notes](#notes)
- [Contribute](#contribute)
- [Meta](#meta)
<!-- /TOC -->


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
1. Download and drop all files in *ShadowView* directory in your project.  
2. Nice Job the best shadow library is now installed! 🎉 🎊 🎈 

## How it works

#### Normal Shadows
 
This shadow framework uses default CoreGraphics shadows by adding it the the layer of the view. 

``` swift
layer.shadowColor : CGColor
layer.shadowRadius : CGFloat
layer.shadowOffset : CGSize
layer.shadowOpacity : Float
layer.shadowPath : CGPath?
```

#### Projected Gaussian Shadows

Here the implemation is different. A shadow container need to be added and all views that needs a blurred shadow need to be subviews of this container.
![][example2-image]
The container takes a screen of all it's subviews and then apply blur on it.

## Usage example

### 	With Storyboard

#### 		Normal Shadows

Any view has new paramerters in the storyboar that you can change in order to add a customize shadow to your view.  

#### 		Projected Gaussian Shadows
Add an UIView to you ViewController, change it class to ShadowView and insert in it all view that needs a blurred shadow.
![][exampleSTR2-image]

### 	Programmatically

#### 		Normal Shadows

Set the shadows parameters to your view and it the shadow will appear! 🌟 

``` swift
view.shadowRadius = 5
view.shadowOffset = CGSize.zero
view.shadowColor = UIColor.black.cgColor
view.shadowOpacity = 0.3 
```

#### 		Projected Gaussian Shadows

Create you container ShadowView and then add views that need Shadows inside of it.
``` swift
    let exampleShadowContainerView = ShadowView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "sample.jpg"))
    
    override func loadView() {
        super.loadView()
        
        exampleShadowContainerView.frame = self.view.bounds
        exampleShadowContainerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        exampleShadowContainerView.shadowOffset = CGSize(width: 0, height: 10)
        exampleShadowContainerView.shadowRadius = 20
        
        self.view.addSubview(exampleShadowContainerView)
        self.exampleShadowContainerView.addSubview(imageView)
        imageView.center = exampleShadowContainerView.center
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame.size = CGSize(width: 200, height: 200)
        imageView.center = exampleShadowContainerView.center
        self.exampleShadowContainerView.updateShadow()
    }
```

*Please see the example for more prescisions.*

## Parameters

``` swift

//Shared Paramerters

@IBInspectable public var shadowRadius : CGFloat

@IBInspectable public var shadowOffset : CGSize

@IBInspectable public var shadowColor : UIColor?

@IBInspectable public var shadowOpacity : Float

//Normal Shadow

@IBInspectable var shadowPath : CGPath?

//ShadowView only

///It changes the size of the projected shadow view.
@IBInspectable var shadowScale : CGFloat

///Changes the tint color of the blurred image
@IBInspectable var shadowTintColor : UIColor

///Changes the saturation of the blurred image (default:1)
@IBInspectable var shadowSaturation : CGFloat

```

## Notes

*Don't* use Views like Sliders or ActivityIndicators, the shadow don't update un real-time.
It's preferable to use statics Views like Labels, images...

## Contribute

We would love you for the contribution to **ShadowView**, check the ``LICENSE`` file for more info.
If you find an issue, [open a ticket](https://github.com/olddonkey/ShadowImageView/issues/new) on it.

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
[example-image]: https://github.com/PierrePerrin/ShadowView/raw/master/Ressources/Example.png
[example2-image]: https://github.com/PierrePerrin/ShadowView/raw/master/Ressources/Example2.png
[example2-image]: https://github.com/PierrePerrin/ShadowView/raw/master/Ressources/Example2.png
[exampleSTR2-image]: https://github.com/PierrePerrin/ShadowView/raw/master/Ressources/exampleSTR2.png



