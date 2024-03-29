require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'active_support/inflector'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise 'Do not double render' if @already_built_response
    self.res.set_header('Location', url)
    self.res.status = 302
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise 'Do not double render' if @already_built_response
    self.res.write(content)
    self.res.content_type=(content_type)
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
      pre_controller = "../views/"
      controller_path = self.class.name.underscore + "/"
      start = File.dirname(__FILE__) + "/"

     template = File.read(start + pre_controller + controller_path + "#{template_name}.html.erb")

     render_content(ERB.new(template).result(binding), "text/html")


     # cd ../views/cats_controller 
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

