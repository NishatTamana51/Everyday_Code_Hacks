# Load necessary libraries
install.packages("magick")
install.packages("ggplotify")
install.packages("patchwork")
library(magick)
library(ggplotify)
library(patchwork)
library(ggplot2)

# Read image files (can be .jpg, .jpeg, or .png)
img2 <- image_read("Kegg_pathway_final.jpeg")   # or "KOG_plot.png"
img3 <- image_read("GO_PLOT_FINAL.jpeg")%>% image_resize("2000x")
img1 <- image_read("COG_classification_final_publication.jpeg")%>% image_resize("2000x")

#Convert images to ggplot-compatible grobs
g1 <- as.ggplot(img1)
g2 <- as.ggplot(img2)
g3 <- as.ggplot(img3)

#Arrange vertically using patchwork
final_plot <- g1 + g2 + g3 +
  plot_layout(ncol = 1) +
  plot_annotation(tag_levels = 'a')  # Adds A, B, C labels

# Step 4: Save the combined plot
ggsave("Figure2.jpeg", final_plot,
       width = 7, height = 14, dpi = 300)
