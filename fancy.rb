
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
	# return true if str.include?('0')
	return true if str.include?('96')
	return true if str.include?('69')
	return false
end

def count_em(string, substring)
  string.scan(/(?=#{substring})/).count
end

def repeating?(no,times=2,middle=false)
	str = no.to_s
	if middle
		 str2 = str[1..1]
		 str3 = str[2..2]
		return true if str2==str3
		return false
	else
		return false
	end
	status = false
	no.to_s.chars.each do |i|
		if count_em(no.to_s,i) >= times
			status = true
			break
		end
	end
	return status
end

def match_start_end?(no)
	str = no.to_s
	str1 = str[0..0]
	str4 = str[3..3]
	return true if str1==str4
	return false
end


from = 7772
to = 9255
fancy = Array.new
from.upto to do |no|
	next if not_interested no
	sum = sum_digits no
	
	if sum.odd? #&& sum!=9
		if repeating?(no,2,true) && match_start_end?(no)
			fancy << no
			p "#{no} (Sum : #{sum})"
		end
			
	end
end

p "#{fancy.count} numbers are found as per your interest"
