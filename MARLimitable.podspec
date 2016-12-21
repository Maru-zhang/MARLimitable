#
# Be sure to run `pod lib lint MARLimitable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MARLimitable'
  s.version          = '0.1.0'
  s.summary          = 'A tiny and legant category for UITextField to make it limitable .'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    限制UITextField字数，并且适配系统键盘以及第三方键盘，本库具有无侵入性，小巧易用等特点，只需要Import相关的分类就可以快速的使用。
                       DESC

  s.homepage         = 'https://github.com/Maru-zhang/MARLimitable'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maru-zhang' => '475435200@qq.com' }
  s.source           = { :git => 'https://github.com/Maru-zhang/MARLimitable.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MARLimitable/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MARLimitable' => ['MARLimitable/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
