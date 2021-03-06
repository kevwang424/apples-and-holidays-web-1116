require 'pry'
holiday_supplies =
{
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}
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
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season,holiday|         #iterate through main array
    if season == :winter
      holiday.each do |event, supplies|
        holiday_hash[season][event] << supply
      end
    end
  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

# columbus_day_supplies = ["Flags", "Parade Floats", "Italian Food"]
#
# add_new_holiday_with_supplies(holiday_supplies, :fall, :columbus_day, columbus_day_supplies)

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  #binding.pry
  items = []
  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |day, supply|
        items << supply
      end
    end
  end
  items.flatten
end

#all_winter_holiday_supplies(holiday_supplies)
def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    puts season.to_s.capitalize + ":"
    holiday.each do |day, supplies|
      puts "  " + capitalize(day.to_s) + ": " + supplies.join(", ")
    end
  end
end

def capitalize(string)
  answer = []
  string.split("_").each {|word| answer << word.capitalize}
  answer.join(" ")
end

#all_supplies_in_holidays(holiday_supplies)


def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  answer = []
  holiday_hash.each do |season, holiday|
    holiday.each do |day, supply|
      answer << day if supply.include?("BBQ")
    end
  end
  answer
end
