# %%


# from ydata_profiling import ProfileReport
import pandas as pd

df = pd.read_csv("../airbnb/data/stg_airbnb_listings.csv")
print(df.head())


# Verificar colunas em branco.
def check_missing(df):
    res_missing = df.isna().sum()
    res_missing = (res_missing/len(df))*100
    return res_missing


check_missing(df).sort_values(ascending=False)
# Retirando colunas 100% em branco.

df.drop(labels=["license","calendar_updated", "neighbourhood_group_cleansed" ], axis="columns", inplace=True)


# profile = ProfileReport(df, title="Profiling Report")
# profile.to_file("stg_airbnb_listings.html")

# %%
