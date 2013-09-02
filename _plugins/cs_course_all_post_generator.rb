require 'set'
module Jekyll

  class CSAllPost < Page
    def underscore(word)
      word.gsub('_', ' ')
    end

    def titleize(word)
      underscore(word).gsub(/\b('?[a-z])/) { $1.capitalize }
    end

    def semesterize(string)
      season = string[0..1]
      case season
      when "fa"
        season = "Fall"
      when "sp"
        season = "Spring"
      when "su"
        season = "Summer"
      when "wi"
        season = "Winter"
      end

      year = string[2..3]
      year = "20" + year

      return "#{season} #{year}"
    end

    def initialize(site, base, dir, categories)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'cs_all_problems.html')

      default_title = "All Practice Problems and Notes"

      self.data['categories'] = categories
      if categories.size == 2
        self.data['title'] = "#{categories[0].upcase} - #{semesterize(categories[1])} - #{default_title}"
      else
        self.data['title'] = "#{categories[0].upcase} - #{default_title}"
      end
    end
  end

  class CSAllPostGenerator < Generator
    safe true

    def generate(site)
      if site.config.key? 'cs_classes'
        cs_classes = site.config['cs_classes']
        cs_classes.each do |course, course_hash|
          semesters_set = Set.new
          unless course_hash.nil? or course_hash.size == 0
            course_hash.each do |topic, topic_hash|
              semesters = topic_hash["semesters"]
              unless semesters.nil? or semesters.size == 0
                semesters.each do |semester|
                  if semester != 'base'
                    semesters_set.add(semester)
                  end
                end
              end
            end
          end
          semesters_set.each do |semester|
            categories = [course, semester]
            semester_dir = "#{course}/#{semester}/practice"
            site.pages << CSAllPost.new(site, site.source, semester_dir, categories)
          end
          site.pages << CSAllPost.new(site, site.source, "#{course}/practice", [course])
        end
      end
    end
  end

end