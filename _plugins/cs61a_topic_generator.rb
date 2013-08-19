module Jekyll

  class CS61ATopicPage < Page
    def underscore(word)
      word.gsub('_', ' ')
    end

    def titleize(word)
      underscore(word).gsub(/\b('?[a-z])/) { $1.capitalize }
    end

    def initialize(site, base, dir, topic)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'cs_topic.html')

      self.data['topic'] = topic
      self.data['title'] = "#{titleize(topic)}"
    end
  end

  class CS61ATopicPageGenerator < Generator
    safe true

    def generate(site)
      if site.config.key? 'cs61a_categories'
        dir = 'cs61a/'
        site.config['cs61a_categories'].each do |topic, semesters|
          semesters.each do |semester|
            semester_dir = dir + semester
            page = CS61ATopicPage.new(site, site.source, File.join(semester_dir, topic), topic)
            site.pages << page
          end
        end
      end
    end
  end

end