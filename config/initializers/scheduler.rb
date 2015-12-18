require 'rufus-scheduler'
require 'logger'

s = Rufus::Scheduler.singleton

unless defined?(Rails::Console)
  job_id = s.every '30m', first: :now, tag: 'lawmaking' do
    begin
      OC_KEY = 'dalikim'

      Rails.logger.info 'START : fetch "www.lawmaking.go.kr"'

      BillNoticeWorker.scrap_draft_bills_by_url("http://www.lawmaking.go.kr/rest/ogLmPp.xml?OC=#{OC_KEY}") do |notice|
        "http://www.lawmaking.go.kr/rest/ogLmPp/#{notice.ogLmPpSeq}/#{notice.mappingLbicId}/#{notice.announceType}.xml?OC=#{OC_KEY}"
      end

      BillNoticeWorker.scrap_administrative_by_url("http://www.lawmaking.go.kr/rest/ptcpAdmPp.xml?OC=#{OC_KEY}") do |notice|
        "http://www.lawmaking.go.kr/rest/ptcpAdmPp/#{notice.ogAdmPpSeq}/#{notice.mappingAdmRulSeq}/#{notice.announceType}.xml?OC=#{OC_KEY}"
      end

      Rails.logger.info 'END : fetch "www.lawmaking.go.kr"'
    rescue => e
      Rails.logger.error 'ERROR : fetch "www.lawmaking.go.kr"'
      Rails.logger.error e
      Rails.logger.error 'END : fetch "www.lawmaking.go.kr"'
    end
    Rails.logger.flush
  end

  Rails.logger.info "lawmaking job id : #{job_id}"
  Rails.logger.flush
end
