class Image < ImageBase
  dragonfly_accessor :file do
    storage_options {|a| { path: "img/%s" % [ UUID.new.generate ] } }
    copy_to(:thumb){|a| a.thumb("300x250>") }
    copy_to(:thumb_high){|a| a.thumb("600x500>") }
  end

  dragonfly_accessor :thumb do
    storage_options {|a| { path: "thumb/%s" % [ UUID.new.generate ] } }
  end

  dragonfly_accessor :thumb_high do
    storage_options {|a| { path: "thumb/%s" % [ UUID.new.generate ] } }
  end
end
