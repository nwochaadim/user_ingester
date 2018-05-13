namespace :users do

  desc "Reads csv from given url and imports records to db"
  task :import, [:import_url] => :environment do |_t, args|
    import_url = "http://assets.cahootify.com/recruitment/people.csv"
    args.with_defaults(import_url: import_url)
    UserImporter.new(args[:import_url]).import
    Rails.logger.info "Importation Done!"
  end

end
