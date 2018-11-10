Pod::Spec.new do |s|
  s.name             = 'LegoCV4'
  s.version          = '0.2.1'
  s.summary          = 'Simple, lightweight native OpenCV wrapper for Objective-C and Swift.'

  s.description      = <<-DESC
LegoCV4 is native OpenCV framework built for Swift and Objective-C projects. It eliminates the need to use Objective-C++ and allows for full compatibility with native Swift projects. The only dependency is native OpenCV framework for iOS.
                       DESC

  s.homepage         = 'https://github.com/swiftymicroservices/LegoCV4'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => '3-clause BSD', :file => 'LICENSE' }
  s.author           = { 'swiftymicroservices' => 'swiftymicroservices@gmail.com' }
  s.source           = { :git => 'https://github.com/swiftymicroservices/LegoCV4.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thelegoless'

  s.ios.deployment_target = '11.0'

  s.public_header_files = 'LegoCV4/LegoCV4/LegoCV4.h'
  s.source_files = 'LegoCV4/LegoCV4/LegoCV4.h'

  s.subspec 'Core' do |subspec|
    subspec.public_header_files = 'LegoCV4/LegoCV4/Wrapper/Core/**/*.h', 'LegoCV4/LegoCV4/Wrapper/Utilities/**/*.h', 
    subspec.private_header_files = 'LegoCV4/LegoCV4/Wrapper/Core/Private/*.h'
    subspec.source_files = 'LegoCV4/LegoCV4/Wrapper/Core/**/*.{h,m,mm}', 'LegoCV4/LegoCV4/Wrapper/Utilities/**/*.{h,m,mm}'
    subspec.dependency 'OpenCV-4.0.0-Beta'
  end

  s.subspec 'ImageProcessing' do |subspec|
    subspec.public_header_files = 'LegoCV4/LegoCV4/Wrapper/ImageProcessing/**/*.h' 
    #subspec.private_header_files = 'LegoCV4/LegoCV4/Wrapper/Core/Private/*.h'
    subspec.source_files = 'LegoCV4/LegoCV4/Wrapper/ImageProcessing/**/*.{h,m,mm}'
    subspec.dependency 'LegoCV4/Core'
  end
  
  s.frameworks = 'UIKit'
end
