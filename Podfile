platform :ios, '8.0'
#use_frameworks!个别需要用到它，比如reactiveCocoa
use_frameworks!
def pods
  pod 'AFNetworking', '~> 3.1.0'
  pod 'ORStackView', '~> 3.0.1'
  pod 'SDAutoLayout', '~> 2.1.7'
  pod 'RNCryptor', '~> 5.0.1'
  pod 'GCDWebServer', '~> 3.3.3'
  pod 'CocoaLumberjack', '~> 2.0.3'
  pod 'GCDWebServer/WebUploader'
  pod 'THPinViewController'
  pod 'SAMKeychain'
  pod 'FMDB'
  pod 'RZTransitions'
end
target 'PasswordMini' do
  pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0.2'
        end
    end
end
