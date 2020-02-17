Pod::Spec.new do |s|
  s.name         = "SYUIInitMethod"
  s.version      = "1.2.6"
  s.summary      = "SYUIInitMethod used to creat UI as easy as possible."
  s.homepage     = "https://github.com/potato512/SYUIInitialize"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "herman" => "zhangsy757@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/potato512/SYUIInitialize.git", :tag => s.version.to_s }
  s.source_files = 'SYUIInitMethod/*.{h,m}'
  s.requires_arc = true
  s.frameworks = 'UIKit', 'CoreFoundation'
end