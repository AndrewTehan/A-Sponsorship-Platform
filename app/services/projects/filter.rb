module Projects
  class Filter
    def initialize(current_user)
      @current_user = current_user
    end

    def do_filter
      results = []

      Project.all.each do |project|
        region_counter = prioritization(project.region_ids, collect_user_setting_settable_ids('Region'))
        sphere_counter = prioritization(project.sphere_ids, collect_user_setting_settable_ids('Sphere'))
        requirement_counter = prioritization(project.requirements_phrase_ids, collect_user_setting_settable_ids('RequirementsPhrase'))

        results << [project.id, region_counter, sphere_counter, requirement_counter]
      end

      collect_projects_average_rating(create_rating(results, 1), create_rating(results, 2), create_rating(results, 3))
    end

    private

    attr_reader :current_user

    def prioritization(entity_ids, user_setting_entity_ids)
      counter = 0

      unless entity_ids.empty?
        user_setting_entity_ids.each do |user_setting_entity_id|
          counter += 1 if entity_ids.include?(user_setting_entity_id)
        end
      end
      counter
    end

    def collect_user_setting_settable_ids(type)
      collection_ids = []

      current_user.user_settings.where(settable_type: type).each do |user_setting_record|
        collection_ids << user_setting_record.settable_id
      end
      collection_ids
    end

    def create_rating(project_collection, index)
      rating = {}

      project_collection.each do |project|
        rating[project[0]] = project[index]
      end
      rating.sort_by { |_k, v| v }.reverse
    end

    def collect_projects_average_rating(region_rating, sphere_rating, requirement_rating)
      projects = {}

      Project.ids.each do |project_id|
        region_rating_index = region_rating.find { |k, _v| k == project_id }[1]
        sphere_rating_index = sphere_rating.find { |k, _v| k == project_id }[1]
        requirement_rating_index = requirement_rating.find { |k, _v| k == project_id }[1]

        average = (region_rating_index + sphere_rating_index + requirement_rating_index) / 3
        projects[project_id] = average
      end
      create_filtered_array(projects)
    end

    def create_filtered_array(projects)
      filtered_projects = []
      sorted = projects.sort_by { |_k, v| v }.reverse

      sorted.each do |k, _v|
        filtered_projects << Project.find_by(id: k)
      end
      filtered_projects
    end
  end
end
