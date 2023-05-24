class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class}##{__method__} must be implemented in subclass"
  end
end
