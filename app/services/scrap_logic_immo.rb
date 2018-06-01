class ScrapLogicImmo

  require 'open-uri'
  require 'nokogiri'



  def create_flat_logic_immo(url)
    @logic_immo = Flat.new
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    @logic_immo.price = html_doc.search('.main-price').first.inner_text
    puts @logic_immo.price


    @logic_immo.remote_photo_url = html_doc.search('.offer-pictures-main img').attribute('src').value
    puts @logic_immo.photo

    @logic_immo.nb_room = html_doc.search('.offer-rooms').first.inner_text
    puts @logic_immo.nb_room


    @logic_immo.surface = html_doc.search('.offer-area-number').first.inner_text
    puts @logic_immo.surface

    @logic_immo.address = html_doc.search('.offer-locality').first.inner_text
    puts @logic_immo.address.strip

    @logic_immo.save
    @logic_immo
  end


end
