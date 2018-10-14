Pod::Spec.new do |s|
  s.name         = "SYUIInitMethod"
<<<<<<< HEAD
  s.version      = "1.1.0"
  s.summary      = "SYUIInitMethod used to creat UI as easy as possible."
=======
  s.version      = "1.0.3"
  s.summary      = "SYUIInitMethod is used for creating UI as easy as possible."
>>>>>>> abff3c7998aef61ac2b04d0ae3cdfc4a3fb6acd7
  s.homepage     = "https://github.com/potato512/SYUIInitialize"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "herman" => "zhangsy757@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/potato512/SYUIInitialize.git", :tag => s.version.to_s }
  s.source_files = 'SYUIInitMethod/*.{h,m}'
  s.requires_arc = false
  s.frameworks = 'UIKit', 'CoreFoundation'
end