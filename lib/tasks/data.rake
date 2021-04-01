namespace :data do
  require Rails.root.join 'lib/helpers/task_helpers'
  include TaskHelpers

  desc 'Import Music Folders'
  task update: :environment do
    update_database
  end

  desc 'Clear database'
  task clear: :environment do
    clear_database
  end
end
