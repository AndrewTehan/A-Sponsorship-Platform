module Projects
  class Filter
    attr_reader :current_user, :result_hash, :filtered_project_array

    def initialize(current_user)
      @current_user = current_user
    end
    
    def do_filter
      @result_hash = {}
      @filtered_project_array = []
  
      Project.all.each do |project|
        @priority_counter = 0
  
        user_setting_regions = collect_user_setting_settable_ids("Region")
        user_setting_spheres = collect_user_setting_settable_ids("Sphere")
        user_setting_requirements = collect_user_setting_settable_ids("RequirementsPhrase")
  
        prioritization(project.region_ids, user_setting_regions)
        prioritization(project.sphere_ids, user_setting_spheres)
        prioritization(project.requirements_phrase_ids, user_setting_requirements)
        
        result_hash[project.id] = @priority_counter
      end
      
      create_filtered_array
    end

    private
  
    def collect_user_setting_settable_ids(type)
      collection_ids = []
      current_user.user_settings.where(settable_type: type).each do |user_setting_record|
        collection_ids << user_setting_record.settable_id
      end
      collection_ids
    end
  
    def create_filtered_array
      result_array = result_hash.sort_by {|k,v| v}.reverse
  
      result_array.each do |k, _v|
        filtered_project_array << Project.find_by(id: k)
      end
  
      filtered_project_array
    end
  
    def prioritization(entity_ids, user_setting_entity_ids)
      unless entity_ids.empty?
        user_setting_entity_ids.each do |user_setting_entity_id|
          @priority_counter += 1 if entity_ids.include?(user_setting_entity_id)
        end
      end
    end
  end
end