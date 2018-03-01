
def sum_digits(no)
	sum = no.to_s.split("").inject(0) { |sum, n| sum + n.to_i }
	if sum >9
		sum = sum_digits sum
	end
	return sum
end

def not_interested no
	str = no.to_s
	# return true if str.include?('8')
	# return true if str.include?('9')
	return true if str.include?('0')
	return true if str.include?('96')
	return true if str.include?('69')
	return false
end


from = 7772
to = 8000#9155
fancy = Array.new
from.upto to do |no|
	next if not_interested no
	sum = sum_digits no
	
	if sum.odd? && sum!=9
		fancy << no
		p "#{no} (Sum : #{sum})"
		
	end
end

p "#{fancy.count} numbers are found as per your interest"
