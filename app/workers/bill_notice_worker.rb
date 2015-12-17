class BillNoticeWorker
  class << self
    def any?(data, key)
      data.has_key?(key) and data[key].try(:any?)
    end

    def scrap_draft_bills(xml)
      doc = Hash.from_xml xml
      doc['result']['list']['ApiList04Vo'].each do |data|
        notice = DraftBillNotice.find_or_initialize_by(pntcNo: data['pntcNo'])
        notice.assign_attributes data
        if block_given?
          detail_doc = Hash.from_xml yield(notice)
          detail_doc['result']['info']['ApiDetile04Vo'].tap do |data|
            notice.assign_attributes data.slice('lmTpNm', 'telNo', 'faxNo', 'email', 'lmPpCts')
            notice.ogLsFlList = data['ogLsFlList'].to_json if any?(data, 'ogLsFlList')
            notice.ogLmPpFlList = data['ogLmPpFlList'].to_json if any?(data, 'ogLmPpFlList')
          end
        end
        notice.save
      end
    rescue => e
      Rails.logger.error e
      throw e if !Rails.env.staging?
    end

    def scrap_administrative(xml)
      doc = Hash.from_xml xml
      doc['result']['list']['ApiList05Vo'].each do |data|
        notice = AdministrativeNotice.find_or_initialize_by(pntcNo: data['pntcNo'])
        notice.assign_attributes data
        if block_given?
          detail_doc = Hash.from_xml yield(notice)
          detail_doc['result']['info']['ApiDetile05Vo'].tap do |data|
            notice.assign_attributes data.slice('lmTpNm', 'telNo', 'faxNo', 'email', 'admPpCts')
            notice.ogAdmFlList = data['ogAdmFlList'].to_json if any?(data, 'ogAdmFlList')
            notice.ptcpAdmPpFlList = data['ptcpAdmPpFlList'].to_json if any?(data, 'ptcpAdmPpFlList')
          end
        end
        notice.save
      end
    rescue => e
      Rails.logger.error e
      throw e if !Rails.env.staging?
    end
  end
end
