module Admin::AdminHelper
  
  #help to check user permission
  #if 0 return admin
  #if 1 return editor
  #if 3 return viewer
  def user_prv_check(user)
    prv = User.find(user).permission.to_i
    if prv == 0 
      return "adminsidebar"
    elsif prv == 1
      return "editorisdebar"
    else prv == 2
      return "viewsidebar"
    end
  end


end
