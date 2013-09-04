module Jekyll
  module CountAllProblemsFilter

    def count_all_problems(class_name, semester)
      return count_all_helper(class_name, semester, "problems")
    end

    def count_all_notes(class_name, semester)
      return count_all_helper(class_name, semester, "notes")
    end

    def count_all_problems_and_notes(class_name, semester)
      return count_all_problems(class_name, semester) + count_all_notes(class_name, semester)
    end

    def count_all_helper(class_name, semester, type)
      count = 0
      @context.registers[:site].config["cs_classes"].each do |class_title, class_content|
        unless class_content.nil? or class_title != class_name
          class_content.each do |topic, topic_content|
            if topic_content.include? type
              count += counter(topic_content[type], semester)
            end
          end
        end
      end
      return count
    end

    def counter(hash, semester)
      count = 0
      hash.each do |item_content|
        unless item_content["semesters"].nil? or item_content["semesters"].size == 0
          item_content["semesters"].each do |semester_info|
            if semester_info.has_key? semester and semester_info[semester]["published"]
              count += 1
            end
          end
        end
      end
      return count
    end

  end
end

Liquid::Template.register_filter(Jekyll::CountAllProblemsFilter)