# Copying ExMove content

pacman::p_load(here)

#download FAQ file from ExMove
download.file(url = "https://raw.github.com/ExMove/Exmove/main/Documentation/FAQ's.qmd", 
              destfile = here("FAQs.qmd"))


# Render FAQ.qmd file?
     