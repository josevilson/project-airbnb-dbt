import pandas as pd
from langdetect import detect

start = 0
df_all = pd.read_csv('data/raw_airbnb_reviews.csv', chunksize=10000, dtype=str)

for df in df_all:
    start += 1

    # Função para detectar a linguagem
    def detectar_linguagem(texto):
        try:
            lang = detect(texto)  # Detecta o idioma usando a biblioteca langdetect
            return lang
        except Exception as e:
            # print(f"Erro na detecção da linguagem: {e} | Texto: {texto[:50]}")  # Mostrar erro e um trecho do texto
            return None  # Caso ocorra um erro (ex.: texto vazio ou não detectável)

    # Detectar o idioma para cada comentário e adicionar a coluna 'linguagem'
    df['comments'] = df['comments'].str.replace('<br/>', '')
    df['comments'] = df['comments'].str.replace(r'[^a-zA-ZÀ-ÖØ-öø-ÿ\s]', '', regex=True)
    df['linguagem'] = df['comments'].apply(detectar_linguagem)

    # Salva o chunk processado em um arquivo CSV
    df.to_csv("data/raw_airbnb_reviews_langdet2.csv", sep=";", mode="a", index=False, header=(start == 1))

    # Mostra o progresso
    part = (800000 / 10000)  # Corrigido para calcular o progresso corretamente
    print(f"Parte {start}/{int(part)} concluída")
