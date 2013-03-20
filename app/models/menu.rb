class Menu
  include Mongoid::Document
  recursively_embeds_many
  
  field :url, :type => String
  field :nome, :type => String
  field :icon, :type => String
  field :primary

  has_and_belongs_to_many :grupos
end
