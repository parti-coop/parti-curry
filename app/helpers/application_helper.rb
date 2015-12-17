module ApplicationHelper
  def full_sanitize(html)
    full_sanitizer = Rails::Html::FullSanitizer.new
    full_sanitizer.sanitize(html)
  end
end
