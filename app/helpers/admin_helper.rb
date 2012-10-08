module AdminHelper
  #help to check user permission
  #if 0 return admin
  #if 1 return editor
  #if 3 return viewer
  def helper_check_permission(user)
    prv = user.permission.to_i
    if prv == 0 
      return "adminsidebar"
    elsif prv == 1
      return "editorisdebar"
    else prv == 2
      return "viewsidebar"
    end
  end

  def help_show_comment_username(c)
    if c.have_user?
      return c.user.username
    else 
      return c.nikename
    end
  end

  def help_show_comment_status(c)
    if c.status
      return "passed"
    else
      return "waitting"
    end
  end

  def help_show_info_status(info)
    if info.status
      return "actived"
    else
      return "unactive"
    end
  end

  def help_show_user_role(user)
    permission = user.permission.to_i
    if permission == 0
      return "Administrator"
    elsif permission == 1
      return "Editor"
    else
      return "Viewer"
    end
  end

end
