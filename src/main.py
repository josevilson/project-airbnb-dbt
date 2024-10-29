# %%
import pandas as pd
from sqlalchemy import create_engine


file_path = "../airbnb/data/stg_airbnb_reviews.csv"

df = pd.read_csv(file_path, dtype=str)



# Crie a string de conexão
connection_string = "postgresql://admin:admin@localhost:5432/airbnb"

# Crie o engine do SQLAlchemy
engine = create_engine(connection_string)
# %%
# Envie o DataFrame para o PostgreSQL

df.to_sql('stg_airbnb_reviews', schema="airbnb", con=engine, if_exists='replace',index=False)
# %%
