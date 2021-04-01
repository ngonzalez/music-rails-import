class AudioFile < ActiveRecord::Base
  belongs_to :music_folder

  dragonfly_accessor :file do
    storage_options {|a| { path: "audio_files/%s" % [ UUID.new.generate ] } }
  end

  has_paper_trail

  acts_as_paranoid

end
