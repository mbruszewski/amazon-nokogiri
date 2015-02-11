class Album < ActiveRecord::Base
  belongs_to :author
  has_many :reviews

  def self.get_album author, doc
    name = doc.at_css("#title_feature_div h1").children.text
    name.strip!
    album = Album.find_or_create_by(name: name, author_id: author.id)
    return album
  end
end
