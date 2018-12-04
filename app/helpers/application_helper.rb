module ApplicationHelper
  def image_link_to(image_path, url, image_tag_options = {}, link_to_options = { })
    link_to url, link_to_options do
      image_tag image_path, image_tag_options
    end
  end
end
