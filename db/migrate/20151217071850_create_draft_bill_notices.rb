class CreateDraftBillNotices < ActiveRecord::Migration
  def change
    create_table :draft_bill_notices do |t|
      # ogLmPpSeq long  입법예고 일련번호
      # lsNm  String  입법예고명
      # lsClsNm String  법령종류
      # asndOfiNm String  소관부처
      # pntcNo  String  공고번호
      # pntcDt  String  공고일자
      # stYd  String  시작일자
      # edYd  String  종료일자
      # FileName  String  파일명
      # FileDownLink  String  파일다운로드 링크
      # readCnt int 조회수
      # mappingLbicId String  법안 매핑 번호
      # announceType  String  공고 종류
      t.integer :ogLmPpSeq
      t.text :lsNm
      t.string :lsClsNm
      t.string :asndOfiNm
      t.string :pntcNo
      t.string :pntcDt
      t.string :stYd
      t.string :edYd
      t.string :FileName
      t.string :FileDownLink
      t.integer :readCnt
      t.string :mappingLbicId
      t.string :announceType

      # lmTpNm  String  입법형식명
      # telNo String  전화번호
      # faxNo String  팩스번호
      # email String  이메일
      # lmPpCts String  입법예고 내용
      t.string :lmTpNm
      t.string :telNo
      t.string :faxNo
      t.string :email
      t.text :lmPpCts

      # 법령안 파일(ogLsFlList)
      #   FileName  String  파일명
      #   FileDownUrl String  다운로드 링크
      # 첨부파일(ogLmPpFlList)
      #   flNm  String  파일명
      #   fileDownUrl String  다운로드 링크
      t.text :ogLsFlList
      t.text :ogLmPpFlList
    end

    add_index :draft_bill_notices, :pntcNo, unique: true
  end
end
