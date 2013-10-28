module Jekyll
  class LinkToProblem < Liquid::Tag
    def initialize(tag_name, name, tokens)
      super
      @name = name
      @string = name.split('/')
    end

    def render(context)
      page = context.registers[:page]
      if page["semester"] != "base"
        if @string.size > 1
          "/#{page["course"]}/#{page["semester"]}/#{@string[0]}/#{@string[1]}"
        else
          "/#{page["course"]}/#{page["semester"]}/#{page["topic"]}/#{@name}"
        end
      elsif @string.size > 1
        "/#{page["course"]}/#{@string[0]}/#{@string[1]}"
      else
        "/#{page["course"]}/#{page["topic"]}/#{@name}"
      end
    end
  end
end

Liquid::Template.register_tag('link_to_problem', Jekyll::LinkToProblem)