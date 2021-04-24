class ImageBase < ActiveRecord::Base
  belongs_to :music_folder

  has_paper_trail

  acts_as_paranoid

  self.table_name = :images
end