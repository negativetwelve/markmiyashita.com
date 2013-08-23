module Jekyll
  module SummarizeFilter
    def summarize(content)
      content.split('<!--start-->').last.split('<!--end-->').first
    end
  end
end

Liquid::Template.register_filter(Jekyll::SummarizeFilter)