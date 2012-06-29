class Object
  # Make an attempt to invoke a method and any additional arguments, but return
  # #self if the Object doesn't respond to `method`
  #
  # method - A symbol representing the method being called.
  # args   - Optionally, provide any arguments to `method`
  #
  # Returns either the return value of `method` or self.
  def try_send(method, args=nil)
    if respond_to?(method)
      if args.present?
        send(method, args)
      else
        send(method)
      end
    else
      self
    end
  end
end
