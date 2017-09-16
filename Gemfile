source 'https://rubygems.org'

git_source(:github) do |repo_name|
	repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
	"https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.6'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

# gem 'react_on_rails', '~> 9.0.1'
gem 'webpack-rails', '~> 0.9.10'
gem 'react_on_rails', '~> 6.8.1'
gem 'haml'
gem 'erb2haml'
gem 'twitter-bootstrap-rails'
gem 'bootstrap-sass', '~> 3.3.7'

gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.5'


group :development, :test do
	gem 'byebug', platform: :mri
end

group :development do
	gem 'web-console', '>= 3.3.0'
	gem 'listen', '~> 3.0.5'
	gem 'spring'
	gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'mini_racer', platforms: :ruby
