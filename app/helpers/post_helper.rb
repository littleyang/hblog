module PostHelper

  def get_infos
    detail = Info.find_by_status(true).detail
    return detail
  end

  def category_options
    Category.all.map { |c| [c.categoryName,c.id]}
  end

end
