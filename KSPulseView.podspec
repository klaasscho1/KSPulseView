Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "KSPulsingView"
s.summary = "Simple pulsing view made in Swift."
s.requires_arc = true

# 2
s.version = "1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Klaas Schoenmaker" => "info@studiokapps.com" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/klaasscho1/KSPulseView"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/klaasscho1/KSPulseView.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"

# 8
s.source_files = "KSPulsingView/**/*.{swift}"

# 9
s.resources = "KSPulsingView/**/*.{png,jpeg,jpg,storyboard,xib}"
end