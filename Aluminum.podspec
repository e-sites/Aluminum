Pod::Spec.new do |s|
  s.name           = "Aluminum"
  s.version        = "1.2.1"
  s.platform       = :ios
  s.ios.deployment_target = "9.0"
  s.summary        = "Robot pattern for your XCTests"
  s.author         = { "Bas van Kuijck" => "bas@e-sites.nl" }
  s.license        = { :type => "MIT", :file => "LICENSE" }
  s.homepage       = "https://github.com/e-sites/#{s.name}"
  s.source         = { :git => "https://github.com/e-sites/#{s.name}.git", :tag => "v#{s.version.to_s}" }
  s.source_files   = "Aluminum/**/*.{h,swift}"
  s.requires_arc   = true
  s.frameworks     = 'XCTest'
  s.swift_versions = [ '5.0' ]
end
