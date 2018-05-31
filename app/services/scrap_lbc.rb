class ScrapLbc

  require 'open-uri'
  require 'nokogiri'



  def create_flat_lbc(url)
    @lbc = Flat.new
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    @lbc.price = html_doc.search('._1F5u3').first.inner_text
    puts @lbc.price


    @lbc.photo = html_doc.search('img').first.attribute('src').value
    puts @lbc.photo

    @lbc.nb_room = html_doc.search('._3Jxf3')[2].inner_text
    puts @lbc.nb_room


    @lbc.surface = html_doc.search('._3Jxf3')[4].inner_text
    puts @lbc.surface

    @lbc.address = html_doc.search('._1aCZv').first.inner_text
    puts @lbc.address.split(" ")[0]

    @lbc.save
    @lbc
  end


end
