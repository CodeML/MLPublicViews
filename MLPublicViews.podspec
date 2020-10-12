Pod::Spec.new do |spec|

  spec.name         = "MLPublicViews"
  spec.version      = "0.0.1"
  spec.author       = { "CoderML" => "weiminglei1990@163.com" }
  spec.homepage     = "https://github.com/CodeML/MLPublicViews"
  spec.summary      = "publicViews"
  spec.source       = { :git => "https://github.com/CodeML/MLPublicViews.git", :tag => "#{spec.version}" }
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.platform = :ios
  spec.requires_arc = true
  spec.source_files  = "BaseClass/*.{h,m}"
  spec.ios.deployment_target = '8.0'
 
  spec.dependency 'MLBaseClass'
end
