#
# Be sure to run `pod lib lint WHScrollPageView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WHScrollPageView'
  s.version          = '0.1.1'
  s.summary          = 'WHScrollPageView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
一个无线滚动的轮播器，只需两行代码就可以搞定网络加载图片，并且实现图片的click监听事件
                       DESC

  s.homepage         = 'https://github.com/liuqiang03109/WHScrollPageView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wenhe-liu' => 'liu.wen.he@chrjdt.com' }
  s.source           = { :git => 'https://github.com/liuqiang03109/WHScrollPageView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WHScrollPageView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WHScrollPageView' => ['WHScrollPageView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
