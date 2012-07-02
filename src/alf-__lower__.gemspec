$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require "alf/!{lower}/version"
$version = Alf::!{upper}::Version.to_s

Gem::Specification.new do |s|
  s.name = "alf-!{lower}"
  s.version = $version
  s.summary = +{summary}
  s.description = +{description}
  s.homepage = +{links.first}
  s.authors = +{authors.collect{|a| a.name}}
  s.email  = +{authors.collect{|a| a.email}}
  s.require_paths = ['lib']
  here = File.expand_path(File.dirname(__FILE__))
  s.files = File.readlines(File.join(here, 'Manifest.txt')).
                 inject([]){|files, pattern| files + Dir[File.join(here, pattern.strip)]}.
                 collect{|x| x[(1+here.size)..-1]}
  *{dependencies.select{|dep| dep.groups != ['runtime']} as dep}{s.add_development_dependency(+{dep.name}, +{dep.version})}{!{"\n  "}}
  *{dependencies.select{|dep| dep.groups.include?('runtime')} as dep}{s.add_dependency(+{dep.name}, +{dep.version})}{!{"\n  "}}
end
