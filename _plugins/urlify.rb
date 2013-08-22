module Jekyll
  module URLifyFilter
    def urlify(word)
      word.gsub('/index.html', '')
    end
  end
end

Liquid::Template.register_filter(Jekyll::URLifyFilter)