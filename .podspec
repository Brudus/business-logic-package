Pod::Spec.new do |s|
  s.name             = 'BusinessLogicPackage'
  s.version          = '0.0.3'
  s.summary          = 'Just a test Swift package.'
  s.homepage         = 'https://github.com/Brudus/business-logic-package'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Manuel Djirlic' => 'https://djirlic.com' }
  s.source           = { :git => 'https://github.com/Brudus/business-logic-package.git', :tag => '0.0.3' }
  s.swift_version    = '5.10'
  s.source_files     = 'Sources/**/*.{h,swift}'
  s.ios.deployment_target = '15.0'
end