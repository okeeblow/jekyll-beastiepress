# Title: FreeBSD manual tag for Jekyll
# Author: Nicole Reid http://cooltrainer.org
# Description: Easily link to BSD manpages.
#
# Syntax {% man [section] command ['release'] ['link text'] ['title text'] %}
#
# Examples:
# {% man 8 lpc "FreeBSD 8.1-RELEASE" "the manpage" "Section 8 of the lpc manpage" %}
# {% man 8 lpc "FreeBSD 8.1-RELEASE" %}
# {% man lpc %}
#
# Output:
# <a href='http://www.freebsd.org/cgi/man.cgi?query=lpc&sektion=8&manpath=FreeBSD 8.1-RELEASE' title='Section 8 of the lpc manpage'>the manpage</a>
# <a href='http://www.freebsd.org/cgi/man.cgi?query=lpc&sektion=8&manpath=FreeBSD 8.1-RELEASE' title='man lpc(8) from FreeBSD 8.1-RELEASE'>lpc(8)</a>
# <a href='http://www.freebsd.org/cgi/man.cgi?query=lpc&sektion=&manpath=' title='man lpc'>lpc</a>
#

module Jekyll

  class ManTag < Liquid::Tag
    @man = nil
    @section = ''
    @release = ''
    @title = ''
    @link = ''

    def initialize(tag_name, markup, tokens)
      if markup =~ /((\d+)\s+)?([a-zA-Z0-9_.]+)(\s+((?:"|')([^"']+)(?:"|')))?(\s+((?:"|')([^"']+)(?:"|')))?(\s+((?:"|')([^"']+)(?:"|')))?/i
        @section = $2
        @man = $3
        @release = $6
        @link = $9
        @title = $12
        if !@link
          @link = @man
          if @section
            @link += "(#{@section})"
          end
          if @release && @title
            @title += " from #{@release}"
          end
        end
        if !@title
          @title = "man #{@man}"
          if @release
            @title += " from #{@release}"
          end
        end
      end
      super
    end

    def render(context)
      output = super
      if @man
        man =  "<a class='man' href='http://www.freebsd.org/cgi/man.cgi?query=#{@man}&amp;ektion=#{@section}&amp;manpath=#{@release}' title='#{@title}'>#{@link}</a>"
      else
        "Error processing input, expected syntax: {% port category/portname ['link text'] ['title text'] %}"
      end
    end
  end
end

Liquid::Template.register_tag('man', Jekyll::ManTag)

