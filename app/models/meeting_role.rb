class MeetingRole < ActiveRecord::Base
  attr_accessible :title, :description, :null => false, :unique => true
  validates :title, :description, :presence => true
  validates :title, :uniqueness => true

  scope :attendee_roles, where("title != 'Absentee'")

  def self.absentee
    find_or_create_by_title("Absentee")
  end

  def self.attendee
    find_or_create_by_title("Attendee")
  end

  def absentee?
    self.title == "Absentee"
  end

  def speaker?
    self.title == "Speaker"
  end

  def attendee?
    self.title == "Attendee"
  end
end
