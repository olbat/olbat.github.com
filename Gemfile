source "https://rubygems.org"

gem "minimal-mistakes-jekyll", "~> 4.21.0"
gem "jekyll-github-metadata", "~> 2.13.0"

group :production do
  gem "htmlcompressor", "~> 0.4.0"
  gem "yui-compressor", "~> 0.12.0"
  gem "nokogiri", "~> 1.11.4"
  gem "json-ld", "~> 2.1.0"
end

group :test do
  gem "html-proofer", "~> 3.13.0"
  gem "json-schema", "~> 2.8.0"
end

group :production, :test do
  gem "rake", ">= 0.7"
end
