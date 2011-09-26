class String
  def camelize
    self[0].capitalize + self[1,self.length-1]
  end

  def camelize!
    self[0] = self[0].capitalize
    self
  end

  def constantize
    names = self.split('::')
    names.shift if names.empty? || names.first.empty?

    constant = Object
    names.each do |name|
      constant = constant.const_defined?(name, false) ? constant.const_get(name) : constant.const_missing(name)
    end
    constant
  end

end

