require ::File.expand_path('../config/environment', __FILE__)

app = Proc.new { |env| ['200', {"Content-Type" => "text/html"}, ["Hello Detva!"]] }

run app
