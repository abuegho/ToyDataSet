### 1: Clean up brand names

refine_original$company = 
  gsub(pattern = "phillips", replacement = "philips",
       refine_original$company, ignore.case = T)
refine_original$company = 
  gsub(pattern = "phllips", replacement = "philips",
       refine_original$company, ignore.case = T)
refine_original$company = 
  gsub(pattern = "phillps", replacement = "philips",
       refine_original$company, ignore.case = T)
refine_original$company = 
  gsub(pattern = "fillips", replacement = "philips",
       refine_original$company, ignore.case = T)
refine_original$company = 
  gsub(pattern = "phlips", replacement = "philips",
       refine_original$company, ignore.case = T)

refine_original$company = 
  gsub(pattern = "akzo", replacement = "akzo",
       refine_original$company, ignore.case = T)
refine_original$company = 
  gsub(pattern = "akz0", replacement = "akzo",
       refine_original$company, ignore.case = T)
refine_original$company = 
  gsub(pattern = "ak zo", replacement = "akzo",
       refine_original$company, ignore.case = T)

refine_original$company = 
  gsub(pattern = "van houten", replacement = "van houten",
       refine_original$company, ignore.case = T)

refine_original$company = 
  gsub(pattern = "unilver", replacement = "unilever",
       refine_original$company, ignore.case = T)
refine_original$company = 
  gsub(pattern = "unilever", replacement = "unilever",
       refine_original$company, ignore.case = T)

## 2: Separate product code and number

refine_original = 
  separate(refine_original, "Product code / number", 
         sep = "-", c("Product code", "number"))

## 3: Add product categories

refine_original$`Product category` = 
  gsub(pattern = "p", replacement = "Smartphone",
       refine_original$`Product code`)
refine_original$`Product category` = 
  gsub(pattern = "v", replacement = "TV",
       refine_original$`Product category`)
refine_original$`Product category` = 
  gsub(pattern = "x", replacement = "Laptop",
       refine_original$`Product category`)
refine_original$`Product category` = 
  gsub(pattern = "q", replacement = "Tablet",
       refine_original$`Product category`)

## 4: Add full address for geocoding