class Hash
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
