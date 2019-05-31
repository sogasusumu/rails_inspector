bundle_install:
	bundle install --path vendor/bundle

link_dummy:
	cd spec/dummy && ln -s ../../spec

rspec_install:
	spec/dummy/bin/rails generate rspec:install

linter:
	bundle exec rubocop ./lib -c .rubocop.yml -R -a

console:
	spec/dummy/bin/rails c
