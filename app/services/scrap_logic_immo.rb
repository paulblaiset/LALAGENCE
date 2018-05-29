class ScrapLogicImmo

  require 'open-uri'
  require 'nokogiri'



  def create_flat_logic_immo
    @logic_immo = Flat.new
    url = "http://www.logic-immo.com/detail-location-dfe81159-6e3f-b26b-f230-3a0328d15075.htm?mea=orpi"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    @logic_immo.price = html_doc.search('.main-price').first.inner_text
    puts @logic_immo.price


    @logic_immo.photo = html_doc.search('.offer-pictures-main img').attribute('src').value
    puts @logic_immo.photo

    @logic_immo.nb_room = html_doc.search('.offer-rooms').first.inner_text
    puts @logic_immo.nb_room


    @logic_immo.surface = html_doc.search('.offer-area-number').first.inner_text
    puts @logic_immo.surface

    @logic_immo.address = html_doc.search('.offer-locality').first.inner_text
    puts @logic_immo.address.strip

    @logic_immo.save
    nil
  end


end
