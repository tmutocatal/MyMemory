# coding: utf-8
class Event < ActiveRecord::Base
  has_many :images
  has_event_calendar
  validates :name, :start_at, :end_at, :body,
	  presence: true
end
