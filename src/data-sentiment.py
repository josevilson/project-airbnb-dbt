# %%
import pandas as pd
from transformers import pipeline

# Use um modelo multilíngue para análise de sentimento
analisador_sentimento = pipeline("sentiment-analysis", model="nlptown/bert-base-multilingual-uncased-sentiment")


df = pd.read_csv("../airbnb/data/raw_airbnb_reviews.csv", dtype=str, nrows=100)


# Função para obter sentimento de cada texto
def obter_sentimento(texto):
    resultado = analisador_sentimento(texto)[0]
    return pd.Series([resultado['label'], resultado['score']])

# Aplicar a análise de sentimento em cada linha
df[['sentimento', 'confianca']] = df['comments'].apply(obter_sentimento)



# %%
def obter_classificacao_sentimento(texto):
