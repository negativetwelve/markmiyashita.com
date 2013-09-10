module Jekyll
  class LinkToTopic < Liquid::Tag
    def initialize(tag_name, name, tokens)
      super
      @name = name
    end

    def render(context)
      page = context.registers[:page]
      if page["semester"] != "base"
        "/#{page["course"]}/#{page["semester"]}/#{@name}"
      else
        "/#{page["course"]}/#{@name}"
      end
    end
  end
end

Liquid::Template.register_tag('link_to_topic', Jekyll::LinkToTopic)