class Tasks::Batch
  URIMain = 'http://api.gnavi.co.jp/RestSearchAPI/20150630/?'
  URIKey = 'keyid=9d62515f3d6bc3045d0f8c8efedba442'
  URICountForward = '&hit_per_page='
  URICount = '100'
  URIOffset = '&offset_page='
  URIOffsetCount = '1'
  URIOffsetCountmax = '74'
  URIFormat = '&format=json'
  URIFreeword = '&freeword=%E7%89%A1%E8%A0%A3'
  URIOyster = ""
  def self.execute
    require 'net/http'
    require 'uri'
    require 'json'
    require 'date'
    db = SQLite3::Database.new("db/development.sqlite3")
    db.transaction do
      sql = "insert into restaurants(name,category,latitude,longitude,url,image_url,areaname,prefname,pr,created_at,updated_at) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)"
      for num_page in 1..URIOffsetCountmax.to_i do
        @URIOyster = URIMain + URIKey + URICountForward + URICount + URIOffset + num_page.to_s + URIFormat + URIFreeword
        uri = URI.parse(@URIOyster)
        json = Net::HTTP.get(uri)
        result = JSON.parse(json)
        total_hit_count = result['total_hit_count'].to_i
        p total_hit_count
        rest = result['rest']
        puts rest[0] rescue nil
        if !result.empty?
          for num in 0..URICount.to_i - 1 do
            name = rest[num]['name'] rescue nil
            category = rest[num]['category'] rescue nil
            latitude = rest[num]['latitude'] rescue nil
            longitude = rest[num]['longitude'] rescue nil
            url = rest[num]['url'] rescue nil
            image_url = rest[num]['image_url']['shop_image1'] rescue nil
            areaname = rest[num]['code']['areaname'] rescue nil
            prefname = rest[num]['code']['prefname'] rescue nil
            pr = rest[num]['pr']['pr_short'] rescue nil
            db.execute(sql, name, category, latitude, longitude, url, image_url, areaname, prefname,pr,DateTime.now.to_s, DateTime.now.to_s)
          end
        end
      end
    end
    db.close
  end
end