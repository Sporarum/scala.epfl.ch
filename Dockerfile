FROM ruby:2.7

RUN apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs \
  && curl -L https://www.npmjs.com/install.sh | sh

RUN gem install  bundler:1.17.2 jekyll 

WORKDIR /srv/jekyll

COPY Gemfile .
COPY Gemfile.lock .


RUN echo -n "bundle version: " && bundle --version
RUN bundle install
RUN mkdir /opt/npm-global
RUN npm config set prefix '/opt/npm-global'
RUN npm config set global true
RUN npm install  bower
RUN echo -n "npm version: " && npm --version
RUN chmod u+s /bin/chown
RUN date
