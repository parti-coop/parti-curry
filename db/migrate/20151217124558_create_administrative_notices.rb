class CreateAdministrativeNotices < ActiveRecord::Migration
  def change
    create_table :administrative_notices do |t|
      # ogAdmPpSeq  long  행정예고 일련번호
      # admRulNm  String  행정예고명
      # lsClsNm String  행정규칙종류
      # asndOfiNm String  기관명
      # pntcNo  String  공고번호
      # pntcDt  String  공고일자
      # stYd  String  시작일자
      # edYd  String  종료일자
      # FileName  String  파일명
      # FileDownLink  String  파일다운로드 링크
      # readCnt int 조회수
      # mappingAdmRulSeq  String  법안 매핑 번호
      # announceType  String  공고 종류
      t.integer :ogAdmPpSeq
      t.text :admRulNm
      t.string :lsClsNm
      t.string :asndOfiNm
      t.string :pntcNo
      t.string :pntcDt
      t.string :stYd
      t.string :edYd
      t.string :FileName
      t.string :FileDownLink
      t.integer :readCnt
      t.string :mappingAdmRulSeq
      t.string :announceType

      # lmTpNm  String  입법형식명
      # telNo String  전화번호
      # faxNo String  팩스번호
      # email String  이메일
      # admPpCts  String  행정예고내용
      t.string :lmTpNm
      t.string :telNo
      t.string :faxNo
      t.string :email
      t.text :admPpCts

      # 행정규칙안 파일(ogAdmFlList)
      #   FileName  String  파일명
      #   FileDownUrl String  다운로드 링크
      # 첨부파일(ptcpAdmPpFlList)
      #   FileName  String  파일명
      #   FileDownUrl String  다운로드 링크
      t.text :ogAdmFlList
      t.text :ptcpAdmPpFlList
    end

    add_index :administrative_notices, :pntcNo, unique: true
  end
end
