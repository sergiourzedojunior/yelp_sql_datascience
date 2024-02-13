# yelp_sql_datascience
building a master database from a .tar file. Step by step with python code
https://www.yelp.com/dataset/download

# steps
- https://www.yelp.com/dataset/download
1. extract tar to json - extract_tar.ipynb
2. transform json to sqlite - json_to_sql.ipynb
3. creat a db master with the .db created in step 3 - master_db.ipynb
# alternative steps
https://www.kaggle.com/datasets/yelp-dataset/yelp-dataset/data
1. kaggle_Code_snippet_to_read_the_files.ipynb
2. creat a db master with the .db created in step 3 - master_db.ipynb

# criando nova tabela checkin
1. nova_checkin.ipynb
   ##### modifica a estrutura da tabela original separando as datas de checkin por linha de acordo com o id 
2. nova_checkin_timestamp.sql
   ##### coluna date str to timestamp
