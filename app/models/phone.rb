class Phone < ApplicationRecord
	belongs_to :user

	def phone_formatted
		number_to_phone(:phonenumber)
	end
end
