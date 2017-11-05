Pod::Spec.new do |s|
  s.name         = "YYGRegular"
  s.version      = "1.0.0"
  s.summary      = "The package of useful tools, include categories and classes"
  s.homepage     = "http://blog.aiyinyu.com"
  s.license      = "MIT"
  s.authors      = { 'tangjr' => 'sirbliar@gmail.com'}
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/AnneBlair/YYGRegular.git", :tag => s.version }
  
  s.source_files  = ["YYGRegular/*.swift"]
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
  s.requires_arc = true
end
