module FirmName
  def set_firm_name(set_name)
    self.firm_name = set_name
  end

  def show_firm_name
    self.firm_name
  end


  attr_accessor :firm_name
end