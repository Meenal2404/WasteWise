import mysql.connector
import pandas as pd

df = pd.read_csv('data/cleaned/wastewise_cleaned.csv')
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='Sqlroot@1234',
    database='wastewise'
)
cursor = conn.cursor()
data = list(df.itertuples(index=False, name=None))
cursor.executemany('''INSERT INTO waste_data 
(date,area,waste_type,quantity_kg,collection_done,
complaints,month,day_of_week,month_num) 
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)''', data)
conn.commit()
print('Done! Rows:', len(df))
conn.close()