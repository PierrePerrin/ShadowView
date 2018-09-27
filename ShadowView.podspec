Pod::Spec.new do |s|
	
s.name             = 'ShadowView'
s.version          = '1.3'
s.summary          = 'ShadowView is an iOS Shadow library that makes view\'s shadow implementation easy and sweet'

s.description      = <<-DESC
Add simple shadows to add a gaussian blurred projection (as a shadow) to any UIView.
The library cimatible with the storyboard.
DESC

s.homepage         = 'https://github.com/PierrePerrin/ShadowView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Pierre Pierrin' => 'pierreperrin@outlook.com' }
s.source           = { :git => 'https://github.com/PierrePerrin/ShadowView.git', :tag => s.version.to_s }
s.ios.deployment_target = '8.1'
s.source_files = 'ShadowView/ShadowView/*.swift'

end
