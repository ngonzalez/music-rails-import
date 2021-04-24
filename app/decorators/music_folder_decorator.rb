class MusicFolderDecorator < Draper::Decorator
  delegate_all
  def public_path
    BACKUP_SERVER_PATH + '/' + path
  end
  def path
    [folder, subfolder, read_attribute(:source), name].compact.join "/"
  end
  def year
    object.year.to_i
  end
  def url
    h.music_folder_path object
  end
  def year_url
    h.music_folders_path q: object.year
  end
  def folder_url
    h.music_folders_path folder: object.folder
  end
  def subfolder_url
    h.music_folders_path folder: object.folder, subfolder: object.subfolder
  end
  def folder_name
    object.folder.titleize.truncate 20, omission: "…#{object.folder.titleize.last(10)}"
  end
  def subfolder_name
    object.subfolder.titleize.truncate 20, omission: "…#{object.subfolder.titleize.last(10)}"
  end
  def url_infos
    hash = { url: url, year_url: year_url }
    hash.merge! folder_name: folder_name, folder_url: folder_url
    hash.merge! subfolder_name: subfolder_name, subfolder_url: subfolder_url if object.subfolder
    hash
  end
  def attributes
    OpenStruct.new(
      object.attributes.deep_symbolize_keys
      .slice(:id, :folder, :subfolder, :folder_created_at)
      .merge(name: formatted_name, year: year)
      .merge(url_infos)
      .compact
    )
  end
  def to_json
    attributes.marshal_dump.to_json
  end
end
