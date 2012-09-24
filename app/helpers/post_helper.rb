module PostHelper

  def get_infos
    detail = Info.find_by_status(true).detail
    return detail
  end

end
