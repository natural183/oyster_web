module ApplicationHelper
  def full_title(page_title)
    base_title = "oyster bar search site | 牡蠣好きのための検索サイト" # 自分のアプリ名を設定する
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end