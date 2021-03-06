FROM ruby:2.4.1

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV PORT 8080

# Serve static files via Rails to make following tutorial
# as simple as possible. In serious production environment,
# this should be disabled and separate container with web servers
# like NGINX should be used.
ENV RAILS_SERVE_STATIC_FILES true

# Install apt-https-transport and lsb-release for Node.js and Yarn
RUN apt-get update && apt-get install -y apt-transport-https && apt-get clean

# Add Node.js and Yarn source
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://deb.nodesource.com/node_8.x jessie main\ndeb-src https://deb.nodesource.com/node_8.x jessie main" | tee /etc/apt/sources.list.d/nodesource.list
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

ADD . /opt/translator
WORKDIR /opt/translator

# Install Ruby dependencies
RUN bundle install

# Install Node.js and Yarn,
# install NPM packages via Yarn,
# run asset precompilation (which runs webpack),
# and remove Node.js and Yarn.
RUN apt-get update && apt-get install -y nodejs yarn \
  && yarn install && rake assets:precompile && apt-get remove -y yarn nodejs \
  && apt-get clean && rm -rf node_modules

EXPOSE 8080

CMD ["./bin/rails", "server"]
