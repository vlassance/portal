class Menu
  include Mongoid::Document
  
  field :url, :type => String
  field :nome, :type => String
  field :icon, :type => String
  field :primary, :type => String

  recursively_embeds_many
  has_and_belongs_to_many :grupos

end
