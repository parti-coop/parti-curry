require 'test_helper'
class BillNoticeWorkerTest < ActiveSupport::TestCase
  test 'draft bill' do
    DraftBillNotice.delete_all

    fetch_draft_bill_notices

    assert_equal 10, DraftBillNotice.count
    notice = DraftBillNotice.find_by ogLmPpSeq: 29948
    assert_equal '[진행]제품의 포장재질 포장방법에 관한 기준 등에 관한 규칙 일부개정령(안) 입법예고',
      notice.lsNm

    fetch_draft_bill_notices
    assert_equal 10, DraftBillNotice.count
  end

  test 'administrative' do
    AdministrativeNotice.delete_all

    fetch_administrative_notices

    assert_equal 10, AdministrativeNotice.count
    notice = AdministrativeNotice.find_by ogAdmPpSeq: 12781
    assert_equal '[진행]연예인 국외공급업무 처리지침 일부개정예규(안) 입안예고',
      notice.admRulNm

    fetch_administrative_notices
    assert_equal 10, AdministrativeNotice.count
  end

  private

  def fetch_draft_bill_notices
    BillNoticeWorker.scrap_draft_bills(data('draft_bill_notices.xml')) do |notice|
      data("draft_bill/#{notice.ogLmPpSeq}.xml")
    end
  end

  def fetch_administrative_notices
    BillNoticeWorker.scrap_administrative(data('administrative_notices.xml')) do |notice|
      data("administrative/#{notice.ogAdmPpSeq}.xml")
    end
  end

  def data(filename)
    file = File.join(Rails.root, 'test', 'data', filename)
    File.read(file)
  end
end
