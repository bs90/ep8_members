FROM ruby:3.2.3-alpine

CMD ["irb"]
ARG RAILS_ENV
# RAILS_ENV = staging for build base image dev/staging, production for build base image production
ENV RAILS_ENV=${RAILS_ENV:-development}
ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE:-secret_key_base}

# Install necessary packages
RUN apk update && \
    apk add --no-cache \
    build-base \
    curl \
    bash \
    postgresql-dev \
    libxml2-dev \
    libxslt-dev \
    libc6-compat

# Install specific versions of Bundler and Rails
RUN gem install bundler -v 2.4.19

# Create app directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . /app

# Copy entrypoint script and make it executable
COPY docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Set entrypoint
ENTRYPOINT ["entrypoint.sh"]
