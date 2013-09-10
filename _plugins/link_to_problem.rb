module Jekyll
  class LinkToProblem < Liquid::Tag
    def initialize(tag_name, name, tokens)
      super
      @name = name
    end

    def render(context)
      page = context.registers[:page]
      if page["semester"] != "base"
        "/#{page["course"]}/#{page["semester"]}/#{page["topic"]}/#{@name}"
      else
        "/#{page["course"]}/#{page["topic"]}/#{@name}"
      end
    end
  end
end

Liquid::Template.register_tag('link_to_problem', Jekyll::LinkToProblem)