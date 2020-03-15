class Student < ActiveRecord::Base
  def to_s
    self.first_name + " " + self.last_name
  end
  def activestring
    if self.active
      'active'
    else
      'not active'
    end
  end
  def activesentence
    # require 'pry'
    # binding.pry
    if self.active
      'This student is currently active.' 
    else
      'This student is currently inactive.'
    end
  end
end