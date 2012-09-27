module PostHelper

  include ActsAsTaggableOn::TagsHelper
  # get personal fellings
  # and return
  def get_infos
    detail = Info.find_by_status(true).detail
    if detail 
      return detail
    else
      return "wating for updatting....."
    end
  end

  # when add and modify an article\
  # to get all article category
  def category_options
    Category.all.map { |c| [c.categoryName,c.id]}
  end
  # count tags' article amount
  # an return the count num
  def count_tag_article(name)
      count = Article.tagged_with(name).count
      return count
  end
  # help to show the article tagsname
  def show_article_tags(tags)
      for tag in tags
        return tag.name
      end
  end
  # to help show article status
  # 1 for published
  # 2 for draft
  def help_show_article_status(status)
    if status == "1"
      return "published"
    end
    if status == "2"
      return "drafted"
    end
  end
end
