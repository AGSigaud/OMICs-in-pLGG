# Use the official R base image
FROM rocker/r-ver:4.2.1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

# Set the working directory in the container
WORKDIR /app

# Copy R scripts, data files, and renv.lock into the container
COPY . /app

# Install renv and restore packages
RUN R -e "install.packages('renv', repos = 'http://cran.rstudio.com/')"
RUN R -e "renv::restore()"

# Set the default command to execute script
CMD ["Rscript", "main_script.R"]
