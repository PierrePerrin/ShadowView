Pod::Spec.new do |s|
s.name             = 'ShadowView'
s.version          = '1.0'
s.summary          = 'ShadowView makes view\'s shadow implementation easy and sweet.'

s.description      = <<-DESC
Add simple shadows to add a gaussian blurred projection (as a shadow) to any UIView.
DESC

s.homepage         = 'https://github.com/PierrePerrin/ShadowView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Pierre' => 'Perrin' }
s.source           = { :git => 'https://github.com/PierrePerrin/ShadowView.git', :tag => s.version.to_s }
s.ios.deployment_target = '9.0'
s.source_files = 'ShadowView/ShadowView/*{.h,.m,.swift}'

end
