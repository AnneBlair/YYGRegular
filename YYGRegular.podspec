Pod::Spec.new do |s|

  s.name         = "YYGRegular"
  s.version      = "0.0.1"
  s.summary      = "A short description of YYGRegular."

  s.description  = <<-DESC
		It's my first framework.
                   DESC

  s.homepage     = "https://github.com/AnneBlair/YYGRegular"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "YinYu" => "sirbliar@gmail.com" }
  # s.social_media_url   = "http://twitter.com/yinyuguang"

  s.ios.deployment_target = "8.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/AnneBlair/YYGRegular", :tag => s.version }

  s.source_files  = ["YYGRegular/*.swift", "YYGRegular/YYGRegular.h", "YYGRegular/YYGRegular.swift"]
  s.public_header_files = ["YYGRegular/YYGRegular.h"]


  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

end
