class Export
    class << self
        def into_json
            filename = "into_json.json"
            directory = "#{Rails.root}/public"
            filepath = directory + "/" + filename
            File.open(filepath, "a+") do | file |
                User.all.each do | user |
                    file.puts user.to_json
                end
            end 
        end
        def into_xml
            filename = "into_xml.xml"
            directory = "#{Rails.root}/public"
            filepath = directory + "/" + filename
            File.open(filepath, "a+") do | file |
                User.all.each do |user|
                   # file.puts JSON.parse(user.to_json).to_xml
                   File.open("#{directory}/#{user.id}.xml", "w"){ | foo | foo.write(JSON.parse(user.to_json).to_xml )}
                end
            end 
        end
    end
end