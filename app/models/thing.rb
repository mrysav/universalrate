class Thing < ActiveRecord::Base
    include PgSearch
    
    has_attached_file :image, 
        :styles => { :medium => "300x300>", :thumb => "100x100>" },
        :storage => :dropbox,
        :dropbox_credentials => Rails.root.join("config/dropbox.yml")
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    pg_search_scope :name_search, :against => :name, :using => [:tsearch, :trigram, :dmetaphone]
    
    validates :name, presence: true
end
