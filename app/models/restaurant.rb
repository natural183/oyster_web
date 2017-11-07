class Restaurant < ActiveRecord::Base
    class << self
        def search(query)
            rel = order("id")
            if query.present?
                rel = rel.where("name LIKE ? OR prefname LIKE ? OR areaname LIKE ? OR pr LIKE ?",
                "%#{query}%","%#{query}%","%#{query}%","%#{query}%")
            end
            rel
        end
    end
end
