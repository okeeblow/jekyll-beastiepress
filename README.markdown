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

Usage
-----

### man
Syntax:

	{% man [section] command ['release'] ['link text'] ['title text'] %}

Examples:

	{% man 8 lpc "FreeBSD 8.1-RELEASE" "the manpage" "Section 8 of the lpc manpage" %}
	{% man 8 lpc "FreeBSD 8.1-RELEASE" %}
	{% man lpc %}

Output:

	<a href='http://www.freebsd.org/cgi/man.cgi?query=lpc&sektion=8&manpath=FreeBSD 8.1-RELEASE' title='Section 8 of the lpc manpage'>the manpage</a>
	<a href='http://www.freebsd.org/cgi/man.cgi?query=lpc&sektion=8&manpath=FreeBSD 8.1-RELEASE' title='man lpc(8) from FreeBSD 8.1-RELEASE'>lpc(8)</a>
	<a href='http://www.freebsd.org/cgi/man.cgi?query=lpc&sektion=&manpath=' title='man lpc'>lpc</a>

### port
Syntax

	{% port portname ['link text'] ['title text'] %}

Example:

	{% port www/subsonic "A link to www/subsonic on Freshports" "Subsonic" %}

Output:

	<a href='http://freshports.org/www/subsonic' title='A link to www/subsonic on Freshports'>Subsonic</a>

### pr
Syntax:

	{% pr [category/]prnumber ['link text'] ['title text'] %}

Example:

	{% pr ports/151677 'the fix' 'Filename handling fix for cuetools.sh' %}
	{% pr ports/151677 %}

Output:

	<a href='http://freshports.org/www/subsonic' title='Filename handling fix for cuetools.sh'>the fix</a>
	<a href='http://www.freebsd.org/cgi/query-pr.cgi?pr=ports/151677' title='Problem Report ports/151677'>ports/151677</a>

