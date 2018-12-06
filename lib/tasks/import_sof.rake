namespace :sof do
  desc 'Imports from CSV'
  task :import => :environment do
    csv_path = ARGV[1]
    fixture = ARGV[2]
    ImportSOFJob.perform_now(csv_path, fixture)
  end
end
