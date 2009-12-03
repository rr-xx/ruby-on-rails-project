xml.instruct!

xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do

  xml.title   "Ilmo 2.0 news"
  xml.link    "rel" => "self", "href" => url_for(:only_path => false, :controller => 'news_feeds', :action => 'index')
  #xml.link    "rel" => "alternate", "href" => url_for(:only_path => false, :controller => 'posts')
  xml.id      url_for(:only_path => false, :controller => 'root')
  xml.updated @feeds.first.updated_at.strftime "%Y-%m-%dT%H:%M:%SZ" if @feeds.any?
  xml.author  { xml.name "Author Name" }

  @feeds.each do |feed|
    xml.entry do
      xml.title   print_feed feed
      xml.link    "rel" => "alternate", "href" => url_for(:only_path => false, :controller => 'posts', :action => 'show', :id => feed.id)
      xml.id      url_for(:only_path => false, :controller => 'posts', :action => 'show', :id => feed.id)
      xml.updated feed.updated_at.strftime "%Y-%m-%dT%H:%M:%SZ"
      #xml.author  { xml.name feed.user.name }
      #xml.summary "Post summary"
      #xml.content "type" => "html" do
      #  xml.text! render("feed")
      #end
    end
  end

end
