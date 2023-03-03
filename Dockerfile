# Use the tidyverse image as a parent image
FROM rocker/tidyverse:4.1.0

# Install additional packages
RUN install2.r --error \
    RSQLite \
    shiny

# Copy app files into container
COPY iris.db /
COPY app.R /
COPY ui.R /
COPY server.R /
# Expose port 3838 for Shiny app
EXPOSE 3838

# Start Shiny app on container startup
CMD ["R", "-e", "shiny::runApp('/app.R', host='0.0.0.0', port=3838)"]
