require 'active_support/core_ext/string/inflections'

class String
  # Singularize or Pluralize a string, as appropriate, and prefixes with `count`.
  #
  # count - If `count == 1`, the `singularize` form of the String will be
  #         returned. For any other number, the String will be pluralized.
  #
  # Examples:
  #
  #   'post'.numberize(15)        # => "15 posts"
  #   'octopi'.numberize(1)       # => "1 octopus"
  #   'banana boat'.numberize(2)  # => "2 banana boats"
  #
  # Returns the singular or plural form of the string based on `count`, with
  # `count` as the prefix.
  def numberize(count)
    "#{ number } " + (number == 1) ? self.singularize : self.pluralize
  end
end
