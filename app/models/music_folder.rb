class MusicFolder < ActiveRecord::Base
  has_many :audio_files, dependent: :destroy
  has_many :images, dependent: :destroy

  serialize :details, Hash

  has_paper_trail

  acts_as_paranoid
end
