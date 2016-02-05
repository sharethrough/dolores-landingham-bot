module NavLinkHelper
  def nav_link(link_text, link_path)

    class_name = current_page?(link_path) ? 'current' : nil

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def is_current(paths)
    is_array = paths.is_a?(Array)

    if is_array
      paths.each do |path|
<<<<<<< HEAD
<<<<<<< HEAD
        if request.fullpath.include? path
=======
        if current_page?(path)
>>>>>>> b5829b5... sidenav spruce
          return true
        end

=======
>>>>>>> 7083f7a... simplify nav_link implimentation
        if request.fullpath.include? path
          return true
        end
      end
    else
<<<<<<< HEAD
<<<<<<< HEAD
      if request.fullpath.include? paths
=======
      if current_page?(paths)
>>>>>>> b5829b5... sidenav spruce
        return true
      end

=======
>>>>>>> 7083f7a... simplify nav_link implimentation
      if request.fullpath.include? paths
        return true
      end
    end

    return false
  end
end

