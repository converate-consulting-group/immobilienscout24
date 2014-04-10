module EstateSupport

  def generate_estate_id
    Time.now.to_f.to_s.gsub(/\./, '/')
  end

end
