module ApplicationHelper
  def twitify(author_name)
    if /^@\w+[^\.]/.match(author_name)
      link_to(author_name, "http://www.twitter.com/#{author_name.gsub('@','')}")
    else
      author_name
    end
  end
end
