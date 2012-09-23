module PostHelper
  def category_options
    Category.all.map{ |c| [c.categoryName,c.id] }
  end

end
