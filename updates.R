# Update Website content

# This script automatically copies files from the ExMove GitHub and saves them to the Website repo
# We can move multiple files automatically and reproducibly, minimising any updating errors!

# Load packages
pacman::p_load(here, tidyverse)

# Download a zip of the complete ExMove repo
download.file(url = "https://github.com/ExMove/ExMove/archive/refs/heads/main.zip", 
              destfile = here("ExMove.zip"))     

# Unzip FAQ file into website
unzip(here("ExMove.zip"), 
      files = file.path("ExMove-main","Documentation","FAQ's.qmd"),
      junkpaths = T)
file.rename("FAQ's.qmd", "FAQs.qmd")

# Unzip User_guide into website
unzip(here("ExMove.zip"), 
      files = file.path("ExMove-main","Documentation","User_guide.qmd"), 
      junkpaths = T)

# Unzip data for user guide into website
unzip(here("ExMove.zip"))

# Copy data directory into website core for user guide
R.utils::copyDirectory(from = here("ExMove-main","Data"), 
                       to = here("Data"))
  
#Delete the zipped and unzipped files after we've extracted what we need!
unlink(here("ExMove.zip"))
unlink(here("ExMove-main"), recursive = TRUE)

#---------------------------------#
# Download individual files (old)

#download FAQ file from ExMove
#download.file(url = "https://raw.github.com/ExMove/Exmove/main/Documentation/FAQ's.qmd", 
#              destfile = here("FAQs.qmd"))

#download FAQ file from ExMove
#download.file(url = "https://raw.github.com/ExMove/Exmove/main/Documentation/User_guide.qmd", 
#              destfile = here("User_guide.qmd"))
