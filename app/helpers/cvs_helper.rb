module CvsHelper
  def is_complete?
    self.cv.attributes.each do |atr|
      return false if atr.blank?
    end
    self.cv.educations.each do |edu|
      edu.attributes.each do |ea|
        return false if ea.blank?
      end
    end
    self.cv.languages.each do |exp|
      exp.attributes.each do |exa|
        return false if exa.blank?
      end
    end
    true
  end
end
