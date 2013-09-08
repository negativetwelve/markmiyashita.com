module Jekyll
  class CodeFileTag < Liquid::Tag
    def initialize(tag_name, name, tokens)
      super
      @name = name
    end

    def render(context)
      page = context.registers[:page]
      "/#{page["course"]}/#{page["topic"]}/code/#{@name}"
    end
  end
end

Liquid::Template.register_tag('code', Jekyll::CodeFileTag)