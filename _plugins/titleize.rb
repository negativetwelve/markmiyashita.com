module Jekyll
  module TitleizeFilter
    def underscore(word)
      word.gsub('_', ' ')
    end

    def titleize(word)
      underscore(word).gsub(/\b('?[a-z])/) { $1.capitalize }
    end
  end
end

Liquid::Template.register_filter(Jekyll::TitleizeFilter)