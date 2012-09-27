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

    def initialize(tag_name, markup, tokens)
      if markup =~ /((\d+)\s+)?([a-zA-Z0-9_.]+)(\s+((?:"|')([^"']+)(?:"|')))?(\s+((?:"|')([^"']+)(?:"|')))?(\s+((?:"|')([^"']+)(?:"|')))?/i
        @section = $2 || ''
        @man = $3 || nil
        @release = $6 || ''
        @link_text = $9 || ''
        @anchor_title = $12 || ''

        unless @link_text
          @link_text = @man

          if @section
            @link_text += "(#{@section})"
          end

          if @anchor_title
            @anchor_title += " from #{@release}" if @release
          end
        end

        unless @anchor_title
          @anchor_title = "man #{@man}"
          @anchor_title += " from #{@release}" if @release
        end
      end
      super
    end

    def render(context)
      output = super

      if @man
        man =  "<a class='man' href='http://www.freebsd.org/cgi/man.cgi?query=#{@man}&amp;sektion=#{@section}&amp;manpath=#{@release}' title='#{@anchor_title}'>#{@link_text}</a>"
      else
        "Error processing input, expected syntax: {% port category/portname ['link text'] ['title text'] %}"
      end
    end
  end
end

Liquid::Template.register_tag('man', Jekyll::ManTag)

