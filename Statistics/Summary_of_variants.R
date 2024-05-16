# Install the necessary package
if (!requireNamespace("BiocManager", quietly = TRUE))
 install.packages("BiocManager")
BiocManager::install("VariantAnnotation")

# Load the library
library(VariantAnnotation)


# Read the VCF file
vcf <- readVcf("test.vcf", "hg19")

# Extract the fixed information (e.g., location)
fixed <- fixed(vcf)

# Extract the variant information (e.g., type)
info <- info(vcf)

# Combine the data
data <- cbind(as.data.frame(fixed), as.data.frame(info))

# Print the summary
print(data)
