Pod::Spec.new do |s|
  s.name         = "SYUIInitMethod"
  s.summary      = "SYUIInitMethod is used for creating UI as easy as possible while testing."
  s.homepage     = "https://github.com/potato512/SYUIInitMethod"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "herman" => "zhangsy757@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/potato512/SYUIInitMethod.git", :tag => s.version.to_s }
  s.source_files = 'SYUIInitMethod/*.{h,m}'
  s.requires_arc = false
  s.frameworks = 'UIKit', 'CoreFoundation'
end