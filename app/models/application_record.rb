class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.order_by_name
    order(name: :asc)
  end
end
