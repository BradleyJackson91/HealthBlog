# Use the official Jekyll image as the base
FROM jekyll/jekyll:latest

# Set the working directory inside the container
WORKDIR /srv/jekyll

# Copy the Gemfile and Gemfile.lock into the image
# Note: You might need to create these in your project directory ahead of building.
# You can run `jekyll new . --force` on your machine to generate these files or let the container do it.
COPY Gemfile* /srv/jekyll/

# Install dependencies
RUN bundle install

# Expose port 4000 for the Jekyll server
EXPOSE 4000

# Command to build and serve the Jekyll site on container startup
# This binds to all interfaces inside the Docker container.
CMD ["jekyll", "serve", "--host", "0.0.0.0"]
