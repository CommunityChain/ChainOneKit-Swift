Pod::Spec.new do |spec|

  spec.name = 'ChainOneKit-Swift'
  spec.module_name = 'ChainOneKit'
  spec.version = '0.0.1'
  spec.summary = 'the kit for ChainOne in swift'

  spec.license = 'MIT'
  spec.homepage = 'https://github.com/CommunityChain/ChainOneKit-Swift.git'
  spec.authors = { 'TangXiaoDe' => 'xiaodehappy@foxmail.com' }
  spec.source = { :git => 'https://github.com/CommunityChain/ChainOneKit-Swift.git', :tag => '0.0.1' }

  spec.platform = :ios, "9.0"

  spec.swift_version = '5.0'

  spec.subspec "FoundationExtension" do |foundationExtension|
    foundationExtension.source_files = 'ChainOneKit/Source/Extension/Foundation+Extension/**/*'
  end
  spec.subspec "UIKitExtension" do |uikitExtension|
    uikitExtension.source_files = 'ChainOneKit/Source/Extension/UIKit+Extension/**/*'
  end
  spec.subspec "Constant" do |constant|
    constant.source_files = 'ChainOneKit/Source/Constant/**/*'
    constant.dependency 'ChainOneKit-Swift/UIKitExtension'
  end
  spec.subspec "Template" do |template|
    template.source_files = 'ChainOneKit/Source/Template/Controller/**/*',
      'ChainOneKit/Source/Template/View/**/*',
      'ChainOneKit/Source/Template/Vender/**/*',
      'ChainOneKit/Source/Template/Other/**/*'
    template.dependency 'ChainOneKit-Swift/Constant'
  end
  spec.subspec "XDPackageTimer" do |timer|
    timer.source_files = 'ChainOneKit/Source/XDPackageTimer/**/*'
  end

end