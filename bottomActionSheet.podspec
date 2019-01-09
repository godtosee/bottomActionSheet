#
#  Be sure to run `pod spec lint bottomActionSheet.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
@version = "0.1.1"
Pod::Spec.new do |s| 
s.name = "bottomActionSheet" 
s.version = @version 
s.summary = "仿照微信的对不阿萨德阿萨德大阿萨德"
s.description = "仿照微信的对不阿萨德阿萨德大阿萨德"
s.homepage = "https://github.com/godtosee/bottomActionSheet"
s.license = {:type => 'MIT', :file => 'LICENSE'}  
s.author = {"huochangyu" => "hcy_huo@163.com" } 
s.ios.deployment_target = '8.0' 
s.source = { :git => "https://github.com/godtosee/bottomActionSheet.git", :tag => "v#{s.version}"}
s.source_files = "bottomActionSheet"
s.requires_arc = true 
s.framework = "UIKit" 
end
