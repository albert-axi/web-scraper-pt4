class Scraper
    BASE_URL = "https://academyxi.com"

    def get_page(url)
        Nokogiri::HTML(open(url))
    end

    def get_courses
        doc = get_page(BASE_URL)

        element = doc.css('.axi-carousel')
        courses = element.css('.list-entry-col')
        courses.each do |course|  
            title = course.css('h4').text.strip 
            excerpt = course.css('p').text.strip 
            url = course.css('a')
            url = url.attr("href").value
            url = url.include?("https") ? url : "#{BASE_URL}#{url}"

            Course.new({title: title, excerpt: excerpt, url: url})
        end
    end


end