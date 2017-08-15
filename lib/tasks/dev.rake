desc "get Ubike date" # 就可以新增訊息在 rake --tasks 裡面
namespace :dev do
  task :fetch_ubike => :environment do
    url = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=ddb80380-f1b3-4f8e-8016-7ed9cba571d5"
    response = RestClient.get(url)
    data = JSON.parse( response.body )


      data["result"]["results"].each do |r|
        existing = Ubike.find_by_ubike_id(r["_id"] )

        if existing
        # update
        else
          Ubike.create(
            :ubike_id => r["_id"],
            :station_number => r["sno"],
            :station_name => r["sna"],
            :area => r["sarea"])
            puts "create sucess #{r["sna"]}"
        end
      end
    end
end
