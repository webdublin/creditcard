class CreditCard
	attr_accessor :cardnumber, :cardtype, :valid

	def initialize(cardnumber, cardtype)
		@cardnumber = cardnumber
		@cardtype = cardtype
	end

	def valid
		number = @cardnumber.to_s.gsub(/[^\d]/, "")
		card = 
		if (number =~ /^4\d{12}(\d{3})?$/)
			card = 'visa'
		end
	
		if (number =~ /^5[1-5]\d{14}$/)
			card = 'mastercard'
		end

		if (@cardtype != card)
			return 'false'
		else
			sum = 0
			for i in 0..number.length
				weight = number[-1*(i+2), 1].to_i * (2 - (i%2))
				sum += (weight < 10) ? weight : weight - 9
			end

			return true if number[-1,1].to_i == (10 - sum%10)%10
			return false
		end
	end
end
