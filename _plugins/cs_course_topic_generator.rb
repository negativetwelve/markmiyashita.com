module Jekyll

  class CSTopicPage < Page
    def underscore(word)
      word.gsub('_', ' ')
    end

    def titleize(word)
      underscore(word).gsub(/\b('?[a-z])/) { $1.capitalize }
    end

    def initialize(site, base, dir, topic, categories)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'cs_topic.html')

      self.data['topic'] = topic
      self.data['categories'] = categories
      self.data['title'] = "#{titleize(topic)}"
    end
  end

  class CSTopicPageGenerator < Generator
    safe true

    def generate(site)
      if site.config.key? 'cs_classes'
        cs_classes = site.config['cs_classes']
        cs_classes.each do |course, course_hash|
          dir = "#{course}/"
          unless course_hash.nil? or course_hash.size == 0
            course_hash.each do |topic, topic_hash|
              semesters = topic_hash["semesters"]
              unless semesters.nil? or semesters.size == 0
                semesters.each do |semester|
                  if semester != 'base'
                    semester_dir = dir + semester
                    site.pages << CSTopicPage.new(site, site.source, File.join(semester_dir, topic), topic, [course, semester, topic])
                  end
                end
                site.pages << CSTopicPage.new(site, site.source, File.join(dir, topic), topic, [course, topic])
              end
            end
          end
        end
      end
    end
  end

end