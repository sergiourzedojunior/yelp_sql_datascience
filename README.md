# yelp_sql_datascience
Creating a master database from a .tar file. Step by step with python code
https://www.yelp.com/dataset/download

# Steps
- https://www.yelp.com/dataset/download
1. extract tar to json - extract_tar.ipynb
2. transform json into sqlite - json_to_sql.ipynb
3. create a master db with the .db created in step 3 - master_db.ipynb
# Alternative steps
https://www.kaggle.com/datasets/yelp-dataset/yelp-dataset/data
1. kaggle_Code_snippet_to_read_the_files.ipynb
2. create a master db with the .db created in step 3 - master_db.ipynb

# Creating a new checkin table
1. nova_checkin.ipynb
   ##### modifies the structure of the original table by separating the checkin data by row according to id 
2. nova_checkin_timestamp.sql
   ##### column date str to timestamp

# Project - clustering of Santa Barbara CA shopping malls by star rating
### model_kmeans.ipynb
1. kmeans code and Silhouette Score test
2. geolocation with .html map
