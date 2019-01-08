@version = “1.0”
Pod::Spec.new do |s| 
s.name = “QF组件” 
s.version = @version 
s.summary = “简述” 
s.description = “描述” 
s.homepage = “https://github.com/godtosee/bottomActionSheet” 
s.license = { :type => ‘MIT’, :file => ‘LICENSE’ } 
s.author = { “huochangyu” => “hcy_huo@163.com” } 
s.ios.deployment_target = ‘8.0’ 
s.source = { :git => “https://github.com/godtosee/bottomActionSheet/releases/tag/v1.0“, :tag => “v#{s.version}” } 
s.source_files = ‘‘QF组件/Code/*/.{h,m}’’ 
s.requires_arc = true 
s.framework = “UIKit” 
end
