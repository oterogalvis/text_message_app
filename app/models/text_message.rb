class TextMessage < ActiveRecord::Base
	validates :number, presence: true
	validates :number, length: { in: 10..10 }
	validates :number, numericality: true
end
