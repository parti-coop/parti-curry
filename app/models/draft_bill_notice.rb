class DraftBillNotice < ActiveRecord::Base
  acts_as :notice

  def source
    '입법예고'
  end

  def title
    lsNm
  end

  def description
    lmPpCts
  end
end
