require 'pry'

# return the second element in the 4th of July array
def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_hash[:summer][:fourth_of_july][1]
end


# iterates through winter holidays adds a supply to each one
def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the Christmas AND the New Year's arrays

  winter = holiday_hash[:winter]

  winter.each do |holiday|
    holiday.each do
      holiday[1] << "Balloons"
    end
  end
end


# adds a supply to memorial day
# adds a different supply to memorial day
def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above. add the second argument (supply) to the memorial day array in holiday_hash
  holiday_hash[:spring][:memorial_day] << supply
end


# modifies the original hash by adding supplies of a new holiday to a season
def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  holiday_hash[season][holiday_name] = supply_array # note: supply_array is already an array
  # remember to return the updated hash
  holiday_hash
end


# has all the winter supplies
def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end


# should output the formatted list of holidays and their supplies
def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    puts "#{season.capitalize}:"

    holiday.each do |holiday_name, supply|
      puts "  #{holiday_name.to_s.split('_').map{|i| i.capitalize}.join(' ')}: #{supply.join(', ')}"
      # .to_s converts to a string: "new_years"
      # .split('_') breaks string into array of individual strings at '_' location: ["new", "years"]
      # .map{|i| i.capitalize} iterates over each word in the array and capitalizes the word: ["New", "Years"]
      # .join(' ') converts array back to a string: "New Years"
    end
  end
end


# should return holidays that have a value of "BBQ" (:fourth_of_july and :memorial_day)
def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists include the string "BBQ"
  holiday_hash.map do |season, holiday| # use .map instead of .each to return new altered array
    holiday.map do |holiday_name, supply|
      holiday_name if supply.include? "BBQ"
    end
  end.flatten.compact
  # use .flatten to return single array instead of nested array:
  # [nil, nil, :fourth_of_july, nil, :memorial_day] --> instead of --> [[nil, nil], [:fourth_of_july], [nil], [:memorial_day]]
  # remove nil values using .compact method: https://stackoverflow.com/questions/13485468/map-and-remove-nil-values-in-ruby
end
