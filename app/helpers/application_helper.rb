module ApplicationHelper
  
  def twitify(author_name)
    if /^@\w+[^\.]/.match(author_name)
      link_to(author_name, "http://www.twitter.com/#{author_name.gsub('@','')}")
    else
      author_name
    end
  end
  
  def possession(name)
    possessive_name = name 
    possessive_name << "'"
    unless /^\w+[s+]$/.match(name).nil?
      possessive_name << "s"
    end
    return possessive_name
  end
  
  def location
    "#{params[:controller]}##{params[:action]}"
  end
  
end
