# WHScrollPageView

[![CI Status](http://img.shields.io/travis/wenhe-liu/WHScrollPageView.svg?style=flat)](https://travis-ci.org/wenhe-liu/WHScrollPageView)
[![Version](https://img.shields.io/cocoapods/v/WHScrollPageView.svg?style=flat)](http://cocoapods.org/pods/WHScrollPageView)
[![License](https://img.shields.io/cocoapods/l/WHScrollPageView.svg?style=flat)](http://cocoapods.org/pods/WHScrollPageView)
[![Platform](https://img.shields.io/cocoapods/p/WHScrollPageView.svg?style=flat)](http://cocoapods.org/pods/WHScrollPageView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

WHScrollPageView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "WHScrollPageView"
```

```swift
 let page = WHScrollPageView(frame: CGRect(x: 20, y: 50, width: 335, height: 120), { (imageView, url) in
            //内部传出imageView跟url，通过url设置imageView的图片
            //imageView.kf.setImage(with: url)
        }) { (index) in
            print("听单处理\(index)")
        }
        
        
        let array = ["https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg", "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-2.jpg", "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-3.jpg"]
        
        //一定要设置图片数组
        page.imagesURLString = array
        
        
        view.addSubview(page)
```



## Author

wenhe-liu, liuqiang03109@gmail.com
## License

WHScrollPageView is available under the MIT license. See the LICENSE file for more info.
