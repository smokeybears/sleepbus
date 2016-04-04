class Trip < ActiveRecord::Base
  has_many :tickets
end
