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

refine_original =
  unite(refine_original, "full_address", 
        c("address", "city", "country"), sep = ", ")

## 5: Create dummy variables for company and product category

refine_original = refine_original %>% 
  group_by(company) %>% 
  mutate(c_philips = company == "philips")
company_philips = sapply(refine_original$c_philips, as.integer)
refine_original = refine_original %>% 
  bind_cols(as_data_frame(company_philips)) %>% 
  select(-c_philips) %>% 
  rename(company_philips = value)

refine_original = refine_original %>% 
  mutate(c_akzo = company == "akzo")
company_akzo = sapply(refine_original$c_akzo, as.integer)
refine_original = refine_original %>% 
  bind_cols(as_data_frame(company_akzo)) %>% 
  select(-c_akzo) %>% 
  rename(company_akzo = value)

refine_original = refine_original %>% 
  mutate(c_van = company == "van houten")
company_van = sapply(refine_original$c_van, as.integer)
refine_original = refine_original %>% 
  bind_cols(as_data_frame(company_van)) %>% 
  select(-c_van) %>% 
  rename(company_van_houten = value)

refine_original = refine_original %>% 
  mutate(c_unilever = company == "unilever")
company_unilever = sapply(refine_original$c_unilever, as.integer)
refine_original = refine_original %>% 
  bind_cols(as_data_frame(company_unilever)) %>% 
  select(-c_unilever) %>% 
  rename(company_unilever = value)

refine_original = mutate(refine_original, p_smartphone = 
                           `Product category` == "Smartphone")
refine_original = mutate(refine_original, p_laptop = 
                           `Product category` == "Laptop")
refine_original = mutate(refine_original, p_tv = 
                           `Product category` == "TV")
refine_original = mutate(refine_original, p_tablet = 
                           `Product category` == "Tablet")

product_smartphone = sapply(refine_original$p_smartphone, as.integer)
refine_original = refine_original %>% 
  bind_cols(as_data_frame(product_smartphone)) %>% 
  select(-p_smartphone) %>% 
  rename(product_smartphone = value)

product_laptop = sapply(refine_original$p_laptop, as.integer)
refine_original = refine_original %>% 
  bind_cols(as_data_frame(product_laptop)) %>% 
  select(-p_laptop) %>% 
  rename(product_laptop = value)

product_tv = sapply(refine_original$p_tv, as.integer)
refine_original = refine_original %>% 
  bind_cols(as_data_frame(product_tv)) %>% 
  select(-p_tv) %>% 
  rename(product_tv = value)

product_tablet = sapply(refine_original$p_tablet, as.integer)
refine_original = refine_original %>% 
  bind_cols(as_data_frame(product_tablet)) %>% 
  select(-p_tablet) %>% 
  rename(product_tablet = value)
