module Jekyll

  class CSProblem < Page
    def underscore(word)
      word.gsub('_', ' ')
    end

    def titleize(word)
      underscore(word).gsub(/\b('?[a-z])/) { $1.capitalize }
    end

    def initialize(site, base, course, semester, semester_info, topic, problem)
      @site = site
      @base = base
      base_dir = "#{course}/"
      if semester != "base"
        base_dir += "#{semester}/"
      end
      base_dir += "#{topic}/"
      @dir = File.join(base_dir, problem["file"])
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, "_layouts"), "cs_problem.html")

      self.data["title"] = course.upcase + " - " + problem["name"]
      self.data["name"] = problem["name"]
      if semester == "base"
        self.data["categories"] = [course, topic]
      else
        self.data["categories"] = [course, semester, topic]
      end
      self.data["file"] = problem["file"]
      self.data["type"] = problem["type"]
      self.data["tags"] = problem["tags"]
      self.data["date"] = semester_info["date"]
      self.data["published"] = semester_info["published"]
      self.data["solution"] = semester_info["solution"]
    end
  end

  class CSProblemGenerator < Generator
    safe true

    def generate(site)
      if site.config.key? "cs_classes"
        cs_classes = site.config["cs_classes"]
        cs_classes.each do |course, course_hash|
          dir = "#{course}/"
          unless course_hash.nil? or course_hash.size == 0
            course_hash.each do |topic, topic_hash|
              problems = topic_hash["problems"]
              unless problems.nil? or problems.size == 0
                problems.each do |problem|
                  semesters = problem["semesters"]
                  semesters.each do |semester_hash|
                    semester_hash.each do |semester, semester_info|
                      site.pages << CSProblem.new(site, site.source, course, semester, semester_info, topic, problem)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

  end

end