BeastiePress for Jekyll
=======================

These Jekyll plugins add ```port```, ```pr```, and ```man``` tags through Liquid, making it easy to link to FreeBSD ports, problem reports, and manual pages.

Basic Setup
-----------
Install the gem:

	[sudo] gem install jekyll-beastiepress

Bundler Setup
-------------
Already using Bundler to manage gems for your Jekyll project? Using Octopress? Just add to your ```Gemfile```:

	gem "jekyll-beastiepress"

Enable
------
Create a plugin file within your Jekyll project's ```_plugins``` directory:

	# _plugins/jekyll-beastiepress.rb
	require "jekyll-beastiepress"
