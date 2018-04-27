#
# Be sure to run `pod lib lint Module_Chat.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LoginModule'
  s.version          = '1.0.0'
  s.summary          = 'LoginModule 模块'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
	LoginModule 模块
                       DESC

  s.homepage         = 'https://github.com/ireliaBR/LoginModule'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '672575302@qq.com' => '672575302@qq.com' }
  s.source           = { :git => 'https://github.com/ireliaBR/LoginModule.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'
  s.source_files = 'LoginModule/Login/Classes/**/*.{h,m}'
  s.resources = [
    'LoginModule/Login/Assets/**/*'
  ]
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  
  s.frameworks = 'UIKit', 'AVFoundation'
  s.dependency 'MTRouter'
  s.dependency 'MTTheme'
  s.dependency 'CommonModule'
  
  s.dependency 'Masonry'
  s.dependency 'SDWebImage'
  s.dependency 'SVProgressHUD'
end
