require 'sinatra/base'
require_relative './lib/student.rb'
require_relative './lib/persistable.rb'

# Why is it a good idea to wrap our App class in a module?
module StudentSite
  
  class App < Sinatra::Base
    get '/' do
      erb :index
    end

    get '/hello-world' do
      @random_numbers = (1..20).to_a
      erb :hello
    end

    get '/artists' do
      @artists = ["John", "Paul", "Ringo", "George"]
      erb :artists
    end

    get '/student_list' do
      @students = Student.all
      erb :student_list
    end

    get '/students/:id' do
      @student = Student.find(params[:id])
      erb :student_page
    end

  end

end