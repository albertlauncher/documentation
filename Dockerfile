FROM ruby
WORKDIR /srv/jekyll
RUN gem install jekyll bundler
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
EXPOSE 4000
ENTRYPOINT ["/docker-entrypoint.sh"]

