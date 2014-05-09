Pod::Spec.new do |s|
  s.name          =  "ObjectiveGit"
  s.version       =  "0.1"
  s.summary       =  "Objective-C bindings to libgit2."
  s.homepage      =  "https://github.com/libgit2/objective-git"
  s.license       =  'MIT'
  s.author        =  { "Tim Clem" => "timothy.clem@gmail.com", "Josh Abernathy" => "josh@github.com" }
  s.source        =  { :git => "https://github.com/libgit2/objective-git.git", :tag => "0.1", :submodules => true }
  s.source_files  =  'Classes/**/*.{h,m}', 'Headers/**/*.h'
  s.osx.libraries =  %w|ssl crypto z libgit2|
  s.ios.libraries =  %w|z libgit2|
  s.requires_arc  =  true

  s.prepare_command = <<-CMD
	./script/bootstrap
	./script/update_libgit2
	cp -R External/libgit2/include Headers
  CMD

  s.private_header_files = 'Headers/**/*.h'

  s.vendored_library = 'External/libgit2.a'

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.6'

  s.prefix_header_contents = '#define GTLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);'
 
  s.description = <<-DESC
    Objective Git provides Objective-C bindings to the libgit2 linkable C Git library.
    This library follows the rugged API as close as possible while trying to maintain a native objective-c feel.
  DESC
end
