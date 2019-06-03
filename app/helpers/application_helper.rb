module ApplicationHelper
    
  # ページごとにタイトルを返す。
  def full_title(page_title = "") # メソッド名と引数の定義
      base_title = "勤怠管理システム"
      if page_title.empty? # 変数に代入
          base_title # page_titleが空（""）の時は既に定義してあるbase_titleを返す
      else
      page_title + " | " + base_title  # 文字列を結合して返す
      end
  end
    
end
