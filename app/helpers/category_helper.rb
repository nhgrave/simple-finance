module CategoryHelper
  def category_options_for_select options = {}
    options.reverse_merge id: nil

    categories = current_user.categories
    categories = categories.where("active IS TRUE OR id = :id", id: options[:id])
    categories.order(:name).pluck(:name, :id)
  end
end
