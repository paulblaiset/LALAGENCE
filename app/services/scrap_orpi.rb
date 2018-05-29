class ScrapOrpi

  require 'open-uri'
  require 'nokogiri'



  def create_flat_orpi
    @orpi = Flat.new
    url = "https://www.orpi.com/annonce-location-appartement-t2-paris-14-75014-b-e0zav6/"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    @orpi.price = html_doc.search('.c-vignette__price').first.inner_text
    puts @orpi.price


    @orpi.photo = html_doc.search('.expanded-img').first.attribute('src').value
    puts @orpi.photo

    @orpi.nb_room = html_doc.search('.c-vignette__txt').first.inner_text
    puts @orpi.nb_room


    @orpi.surface = html_doc.search('.c-vignette__txt').last.inner_text
    puts @orpi.surface

    @orpi.address = html_doc.search('.c-vignette__address').first.inner_text
    puts @orpi.address


    @orpi.save
    nil
  end


end
