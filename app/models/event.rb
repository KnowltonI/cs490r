class Event < ActiveRecord::Base
	has_many :comments
	has_many :users, through: :comments

	validates :title, presence: true
	validates :allDay, presence: true

	scope :between, lambda {|start_time, end_time| {:conditions => ["? < 
     ?", Event.format_date(start_time), Event.format_date(end_time)] } }

	def self.format_date(date_time)
      Time.at(date_time.to_i).to_formatted_s(:db)
    end

    def as_json(option = {})
      {
        :id => self.id,
        :title => self.title,
        :description => self.description || "",
        :start => starts_at.rfc822,
        :end => ends_at.rfc822,
        :allDay => self.all_day,
        :recuring => false,
        :url => Rails.application.routes.url_helpers.event_path(id),
      }
    end
end
