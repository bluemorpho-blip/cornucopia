class Item < ActiveRecord::Base
  belongs_to :cornucopia

  def self.valid_params?(params)
    return !params[:name].empty?
  end
end
