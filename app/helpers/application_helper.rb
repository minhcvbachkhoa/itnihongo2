module ApplicationHelper
  def full_title title
    title.empty? ? t("title") : title + " | " + t("title")
  end
end
