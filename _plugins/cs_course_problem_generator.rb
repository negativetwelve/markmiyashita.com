module Jekyll

  class CSItem < Page
    def underscore(word)
      word.gsub('_', ' ')
    end

    def titleize(word)
      underscore(word).gsub(/\b('?[a-z])/) { $1.capitalize }
    end

    def initialize(site, base, course, semester, semester_info, topic, item, is_problem)
      @site = site
      @base = base
      base_dir = "#{course}/"
      if semester != "base"
        base_dir += "#{semester}/"
      end
      base_dir += "#{topic}/"
      @dir = File.join(base_dir, item["file"])
      @name = 'index.html'

      self.process(@name)

      if is_problem
        self.read_yaml(File.join(base, "_layouts"), "cs_problem.html")
      else
        self.read_yaml(File.join(base, "_layouts"), "cs_note.html")
      end

      self.data["title"] = course.upcase + " - " + item["name"]
      self.data["name"] = item["name"]
      self.data["course"] = course
      self.data["topic"] = topic

      if semester == "base"
        self.data["categories"] = [course, topic]
      else
        self.data["categories"] = [course, semester, topic]
      end

      self.data["file"] = item["file"]
      self.data["semester"] = semester
      self.data["tags"] = item["tags"]
      self.data["date"] = semester_info["date"]
      self.data["published"] = semester_info["published"]
      self.data["clean_url"] = self.url.gsub('/index.html', '')
    end
  end

  class CSProblem < CSItem
    alias :super_initialize :initialize

    def initialize(site, base, course, semester, semester_info, topic, problem)
      super_initialize(site, base, course, semester, semester_info, topic, problem, true)
      self.data["type"] = problem["type"]
      self.data["solution"] = semester_info["solution"]
      self.data["is_problem"] = true
      self.data["is_note"] = false
    end
  end

  class CSNote < CSItem
    alias :super_initialize :initialize

    def initialize(site, base, course, semester, semester_info, topic, note)
      super_initialize(site, base, course, semester, semester_info, topic, note, false)
      self.data["is_problem"] = false
      self.data["is_note"] = true
    end
  end

  class CSProblemGenerator < Generator
    safe true

    def generate(site)
      unless site.custom_posts.key? "cs_classes"
        site.custom_posts["cs_classes"] = []
      end
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
                      if semester_info["published"]
                        new_problem = CSProblem.new(site, site.source, course, semester, semester_info, topic, problem)
                        site.pages << new_problem
                        site.custom_posts["cs_classes"] << new_problem
                      end
                    end
                  end
                end
              end
              notes = topic_hash["notes"]
              unless notes.nil? or notes.size == 0
                notes.each do |note|
                  semesters = note["semesters"]
                  semesters.each do |semester_hash|
                    semester_hash.each do |semester, semester_info|
                      if semester_info["published"]
                        new_note = CSNote.new(site, site.source, course, semester, semester_info, topic, note)
                        site.pages << new_note
                        site.custom_posts["cs_classes"] << new_note
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

end