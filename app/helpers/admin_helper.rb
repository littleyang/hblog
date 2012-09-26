module AdminHelper
  #help to check user permission
  #if 0 return admin
  #if 1 return editor
  #if 3 return viewer
  def helper_check_permission(id)
    prv = User.find_by_id(id).permission.to_i
    if prv == 0 
      return "adminsidebar"
    elsif prv == 1
      return "editorisdebar"
    else prv == 2
      return "viewsidebar"
    end
  end

  def status_options

  end


end
