activate :aria_current
activate :autoprefixer
activate :asset_hash

set :css_dir, "assets/stylesheets"
set :fonts_dir, "assets/fonts"
set :images_dir, "assets/images"
set :js_dir, "assets/javascripts"

set :markdown,
  autolink: true,
  fenced_code_blocks: true,
  footnotes: true,
  highlight: true,
  smartypants: true,
  strikethrough: true,
  tables: true,
  with_toc_data: true
set :markdown_engine, :redcarpet

page "/*.json", layout: false
page "/*.txt", layout: false
page "/*.xml", layout: false

activate :blog do |blog|
  #set options on the blog
  blog.prefix = 'blog'
  blog.layout = 'layout-blog'
  blog.tag_template = 'blog/tag.html'
  blog.calendar_template = 'blog/calendar.html'
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
end

configure :development do
  activate :livereload do |reload|
    reload.no_swf = true
  end
end

configure :production do
  activate :gzip
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
end
