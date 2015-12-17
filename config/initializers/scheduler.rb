require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '30m' do
  OC_KEY = 'dalikim'

  Rails.log.info 'START : fetch "www.lawmaking.go.kr"'

  xml = open("http://www.lawmaking.go.kr/rest/ogLmPp.xml?OC=#{OC_KEY}").read
  BillNoticeWorker.scrap_draft_bills(xml) do |notice|
    open("http://www.lawmaking.go.kr/rest/ogLmPp/#{notice.ogLmPpSeq}/#{notice.mappingLbicId}/#{notice.announceType}.xml?OC=#{OC_KEY}").read
  end

  xml = open("http://www.lawmaking.go.kr/rest/ptcpAdmPp.xml?OC=#{OC_KEY}").read
  BillNoticeWorker.scrap_administrative(xml) do |notice|
    open("http://www.lawmaking.go.kr/rest/ptcpAdmPp/#{notice.ogAdmPpSeq}/#{notice.mappingAdmRulSeq}/#{notice.announceType}.xml?OC=#{OC_KEY}").read
  end

  Rails.log.info 'END : fetch "www.lawmaking.go.kr"'
end
