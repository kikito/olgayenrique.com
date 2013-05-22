require "kramdown"
set :markdown_engine, ::Tilt::KramdownTemplate
###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
compass_config do |config|
#  config.output_style = :compressed
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###
#
set :css_dir,    'css'
set :js_dir,     'js'
set :images_dir, 'img'

# Render foo.md as foo/index.html (so that it can be accessed as /foo and not as foo.html)
# activate :directory_indexes

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# load environment variables from .env if it exists
activate :dotenv

# sync with aws (needs a .env file with the right variables)
activate :sync do |sync|
  sync.fog_provider           = 'AWS' # Your storage provider
  sync.fog_directory          = ENV['AWS_BUCKET'] # Your bucket name
  sync.fog_region             = ENV['AWS_REGION']
  sync.aws_access_key_id      = ENV['AWS_KEY']
  sync.aws_secret_access_key  = ENV['AWS_SECRET']
  sync.existing_remote_files  = 'keep' # What to do with your existing remote files? (keep or delete)
  sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
