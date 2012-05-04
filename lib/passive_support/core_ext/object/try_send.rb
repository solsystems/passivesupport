class Object
  def try_send(method)
    self.respond_to?(method) ? self.send(method) : self
  end
end
