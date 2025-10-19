SANITY_DIR = "#{ENV["HOME"]}/Downloads/filterizer/".freeze

desc "Export models for Sanity"
task export: :environment do
  [Neighborhood, Venue, Event].each do |klass|
    name = klass.name.downcase
    data = []
    klass.all.each do |n|
      attr = n.attributes
      id = attr.delete("id")
      data << {
        "model" => "artcalendar.#{name}",
        "pk" => id,
        "fields" => attr
      }
      # rubocop:disable Style/FileWrite
      File.open(SANITY_DIR + "#{name}.yaml", "w") do |f|
        f.write(data.to_yaml)
      end
      # rubocop:enable Style/FileWrite
    end
  end
end
