module SettableEntityHelper
  def regions
    Region.where(id: entity_params[:region_ids])
  end

  def spheres
    Sphere.where(id: entity_params[:sphere_ids])
  end

  def conditions
    RequirementsPhrase.where(id: entity_params[:requirements_phrase_ids])
  end
end
