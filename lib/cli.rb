require_relative '../config/environment.rb'
class CLI
    def initialize
       Scraper.new.get_courses
    end

    def start
        puts "Welcome to my CLI App"
        puts "Do you want to view our courses?"
        new_line
        puts "[y] for YES OR any characters to exit"

        prompt_response
    end

    def prompt_response
        response = gets.strip

       if response.downcase == "y"
            show_courses
       else
            system("exit")  
       end  
    end

    def show_courses
        Course.print_courses 

        puts "Input the number of the course you want to check:"
        
        response = gets.strip.to_i

        if response > Course.all.count || response < 1
            puts "Input out of range"
        else
            Course.all[response - 1].print_details
        end
    end

    def new_line
        puts ""
    end
end

