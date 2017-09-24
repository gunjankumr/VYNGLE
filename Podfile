platform :ios, '9.0'
use_frameworks!

def shared_pod
  pod 'IQKeyboardManager'
  pod 'SVProgressHUD'
  pod 'RealmSwift'
  pod 'Moya', '~> 8.0.3'
  pod 'ObjectMapper'
  pod 'Moya-ObjectMapper'
  pod 'FBSDKLoginKit', '~> 4.18'
  pod 'SwiftyJSON'
  pod 'GMStepper'
end

target 'VYNGLE' do
  shared_pod
end

#target 'VYNGLETests' do
#  shared_pod
#end
#
#target 'VYNGLEUITests' do
#  shared_pod
#end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

