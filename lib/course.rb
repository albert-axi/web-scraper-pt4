class Course
    @@all = []
    def initialize(attributes)
        attributes.each do |key, value|
            self.class.attr_accessor key
            self.send("#{key}=", value)
        end

        self.class.all << self
    end

    def print_details
        puts "#{title}"
        puts "=========================="
        puts "#{excerpt}"

        details = Scraper.new.get_page(url)
        text = details.css('.elementor-text-editor span')[0].text.strip
        puts text
    end

    def self.all
        @@all
    end

    def self.print_courses
        all.each.with_index(1) {|course, i| puts "#{i}. #{course.title}"}
    end
end