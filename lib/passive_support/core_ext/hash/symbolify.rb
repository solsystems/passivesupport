class Hash
  def symbolify(depth=1)
    inject({}) do |memo, (k,v) |
      memo[k.to_sym] = if depth > 1 and v.is_a? Hash
        v.symbolify(depth-1)
      else
        v
      end
      memo
    end
  end
end
