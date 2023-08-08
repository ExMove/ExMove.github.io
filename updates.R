#---------------------------------#
# Updating ExMove website content #
#---------------------------------#

# This script copies files from the ExMove GitHub and saves them to the Website repo
# We can move multiple files automatically and reproducibly, hopefully minimising any updating errors

# Load packages
pacman::p_load(here)

# Download a zip file of the complete ExMove repo (only 21MB so pretty quick)
download.file(url = "https://github.com/ExMove/ExMove/archive/refs/heads/main.zip", 
              destfile = here("ExMove.zip"))     

# Unzip FAQ's.qmd file into website and rename
unzip(here("ExMove.zip"), 
      files = file.path("ExMove-main","Documentation","FAQ's.qmd"),
      junkpaths = T)
file.rename("FAQ's.qmd", "FAQs.qmd")

# Unzip User_guide.qmd into website
unzip(here("ExMove.zip"), 
      files = file.path("ExMove-main","Documentation","User_guide.qmd"), 
      junkpaths = T)

# Unzip data for user guide into website
unzip(here("ExMove.zip"))

# Copy data directory into website core for user guide
R.utils::copyDirectory(from = here("ExMove-main","Data"), 
                       to = here("Data"))
  
# Delete both the zipped and unzipped files after we've extracted what we need!
unlink(here("ExMove.zip"))
unlink(here("ExMove-main"), recursive = TRUE)

# Now that almost everything is copied, render the website
quarto::quarto_render()

# Finally, replace the latex version of the user guide with the nicely-rendered pdf version (directly from ExMove repo)
download.file(url = "https://raw.github.com/ExMove/Exmove/main/Documentation/User_guide.pdf",
              destfile = here("docs","User_guide.pdf"))

#---------------------------------#
# Download individual files (old) #
#---------------------------------#

#download FAQ file from ExMove
#download.file(url = "https://raw.github.com/ExMove/Exmove/main/Documentation/FAQ's.qmd", 
#              destfile = here("FAQs.qmd"))

#download FAQ file from ExMove
#download.file(url = "https://raw.github.com/ExMove/Exmove/main/Documentation/User_guide.qmd", 
#              destfile = here("User_guide.qmd"))
