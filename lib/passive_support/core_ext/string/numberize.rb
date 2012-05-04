class String
  def numberize(number)
    "#{number} " + ((number == 1) ? self.singularize : self.pluralize)
  end
end
