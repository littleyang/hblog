module PostHelper

  def get_infos
    detail = Info.find_by_status(true).detail
    return detail
  end

  def category_options
    Category.all.map { |c| [c.categoryName,c.id]}
  end

  include ActsAsTaggableOn::TagsHelper

  def count_tag_article(name)
      count = Article.tagged_with(name).count
      return count
  end

end
