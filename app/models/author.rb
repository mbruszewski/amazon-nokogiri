class Author < ActiveRecord::Base
  has_many :albums


  def self.get_author doc
    name = doc.at_css("#artistLink_feature_div #ProductInfoArtistLink").children.text
    name.strip!
    author = Author.find_or_create_by(name: name)
    return author
  end
end
