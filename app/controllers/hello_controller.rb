class HelloController < ApplicationController
  def index
    @message = "hello!"
    @extra = "I am the hello controller "
    @count = 2
  end
end
