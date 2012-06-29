require 'active_support/core_ext/enumerable'
class Hash
  # Get the leaf nodes in a Hash as an Array.
  #
  # Examples:
  #
  #   {
  #     "beverages" => { "caffinated" => ["coffee", "tea"] },
  #     "vehicles" => ["car", "truck", "airplane"],
  #     "dessert" => "ice cream",
  #   }.leaves
  #   # => ["coffee", "tea", "car", "truck", "airplane", "ice cream"]
  #
  # Returns an Array conaining the leaf values of this Hash.
  def leaves
    values.map do |value|
      case value
      when Hash
        value.leaves
      when Array
        value
      else
        [value]
      end
    end.sum([])
  end
end
