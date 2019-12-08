class Cornucopia < ActiveRecord::Base
  has_many :items
  belongs_to :user

  def self.valid_params?(params)
    reutrn !params[name].empty?
  end
end
