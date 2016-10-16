

Pod::Spec.new do |s|
  s.name             = 'wow-util'
  s.version          = '0.1.0'
  s.summary          = 'wow-util is wowdsgn base library'


  s.description      = <<-DESC
wow-util is wowdsgn base library it has log
                       DESC

  s.homepage         = 'https://github.com/gakaki/wow-util'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gakaki' => 'gakaki@gmail.com' }
  s.source           = { :git => 'https://github.com/gakaki/wow-util.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'wow-util/Classes/**/*.{h,m,swift}','wow-util/Classes/*.{h,m,swift}'

  # s.resource_bundles = {
  #   'wow-util' => ['wow-util/Assets/*.png']
  # }

#   s.public_header_files = 'wow-util/Classes/**/*.h','wow-util/Classes/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'YYWebImage'
  s.dependency 'YYImage/WebP'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  #s.dependency 'XCGLogger', '~> 4.0.0'
end
