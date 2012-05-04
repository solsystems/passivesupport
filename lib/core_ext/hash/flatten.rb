class Hash
  def flatten(separator='/')
    inject([]) do | memo, (key,values) |
      if values.is_a? Array
        memo << key.to_s
      elsif values.is_a? Hash
        values = values.flatten(separator)
        memo += values.map { |ending| "#{key}#{separator}#{ending}" }
      end
      memo
    end
  end
end
