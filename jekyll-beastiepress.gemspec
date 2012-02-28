Gem::Specification.new do |s|
  s.name        = 'jekyll-beastiepress'
  s.version     = '1.0.1'
  s.date        = '2012-02-21'
  s.summary     = "FreeBSD community tags for Jekyll"
  s.description = "Extend Jekyll with easy tags for linking FreeBSD manual pages, ports, and problem reports."
  s.authors     = ["Nicole Reid"]
  s.email       = 'root@cooltrainer.org'
  s.files       = ["lib/jekyll-beastiepress.rb", "lib/jekyll-beastiepress/man_tag.rb", "lib/jekyll-beastiepress/port_tag.rb", "lib/jekyll-beastiepress/pr_tag.rb"]
  s.homepage    = 'https://github.com/okeeblow/jekyll-beastiepress'
  s.signing_key = '/usr/home/nicole/.ssh/id_rsa'
  s.add_runtime_dependency('jekyll', [">= 0.10.0"])
  s.add_runtime_dependency('liquid', [">= 2.2.2"])
end
