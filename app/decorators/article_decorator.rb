module ArticleDecorator
  def elapsed_time(article)
    post_sec = article.created_at.to_i
    now_sec = Time.now.to_i

    sec_per_min = 60
    sec_per_hour = 3600
    sec_per_day = 60 * 60 * 24
    sec_per_week  =  sec_per_day * 7

    elapsed_sec = now_sec - post_sec
    elapsed_min = elapsed_sec / sec_per_min
    elapsed_hour = elapsed_sec / sec_per_hour
    elapsed_day = elapsed_sec / sec_per_day
    elapsed_week = elapsed_sec / sec_per_week

    if elapsed_min < 1
      'just now'
    elsif elapsed_min >= 1 && elapsed_min < 2
      '1 minute ago'
    elsif elapsed_min >= 2 && elapsed_min < 60
      "#{elapsed_min} minutes ago"
    elsif elapsed_hour >= 1 && elapsed_hour < 2
      '1 hour ago'
    elsif elapsed_hour >= 2 && elapsed_hour < 24
      "#{elapsed_hour} hours ago"
    elsif elapsed_day >= 1 && elapsed_day < 2
      '1 day ago'
    elsif elapsed_day >= 2 && elapsed_day < 7
      "#{elapsed_day} days ago"
    elsif elapsed_week >= 1 && elapsed_week < 2
      '1 week ago'
    elsif elapsed_week >= 2 && elapsed_week <= 4
      "#{elapsed_week} weeks ago"
    else
      article.created_at.strftime('%y/%m/%d')
    end
  end
end
