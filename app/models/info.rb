class Info < ActiveRecord::Base
  attr_accessible :detail, :title, :user_id
  belongs_to :user
  def self.random_to_show_info
    infos = self.find_all_by_status(true)
    time = Time.now.hour+1
    for time in 1..3
      show_id = (((((Random.new(24)).rand)*1988)+time)%time).to_i
    end
    for time in 4..8
      show_id = (((((Random.new(24)).rand)*1988)+time)%time).to_i
    end
    for time in 9..16
      show_id = (((((Random.new(24)).rand)*1988)+time)%time).to_i
    end
    for time in 17..24
      show_id = (((((Random.new(24)).rand)*1988)+time)%time).to_i
    end
     if infos[show_id] != nil
       return infos[show_id]
     else
       return infos[0]
     end
  end
end
