Pod::Spec.new do |s|
  s.name         = "LBTextfield01"
  s.version      = "1.0.0"
  s.summary      = "This is a textfield with an image view in the right side"
  s.description  = "Sometimes textfield a small image to describe what users are going to type in the box. This textfield has a built-in image view"
  s.homepage     = "https://github.com/jjeui0308/LBTextfield01"
  s.license      = "MIT"
  s.author             = { "Justin Ji" => "jjeui0308@gmail.com" }
  s.social_media_url   = "http://twitter.com/jijustin003"
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/jjeui0308/LBTextfield01.git", :tag => "1.0.0" }
  s.source_files  = "LBTextfield01/**/*"

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
end
