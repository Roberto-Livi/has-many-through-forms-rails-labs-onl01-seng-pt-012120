class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  # Prevents from creating a category that already exists
  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      # Prevents creating a new category that is left blank
      self.categories << category unless category.name.empty?
    end
  end

end
