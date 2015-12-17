class AdministrativeNotice < ActiveRecord::Base
  acts_as :notice

  def source
    '행정예고'
  end

  def title
    admRulNm
  end

  def description
    admPpCts
  end
end
