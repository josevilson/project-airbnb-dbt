import pandas as pd
from polyglot.text import Text

# Função para classificar o sentimento usando Polyglot com hint_language_code
def classificar_sentimento(texto, linguagem='es'):
    """
    Classifica o sentimento de um texto com base na polaridade usando Polyglot.

    Parâmetros:
    texto (str): O texto a ser analisado.
    linguagem (str): O código da linguagem (default é 'en' para inglês).

    Retorno:
    str: "Positiva", "Negativa", ou "Neutra", dependendo da polaridade do texto.
    """
    try:
        # print(texto)
        polyglot_text = Text(texto, hint_language_code=linguagem)  # Usa o código do idioma
        polaridade = polyglot_text.polarity  # Obtém a polaridade
        if polaridade > 0:
            return "Positiva"
        elif polaridade < 0:
            return "Negativa"
        else:
            return "Neutra"
    except Exception as e:
        # print(f"Erro na classificação do sentimento: {e} | Texto: {texto[:50]}")  # Mostrar erro e trecho do texto
        return "Erro"  # Caso ocorra um erro no processamento de sentimento

# Função para filtrar o DataFrame com base na linguagem
def filtrar_df_linguagem(df, linguagem):
    """
    Filtra o DataFrame com base na linguagem especificada na coluna 'linguagem'.
    
    Parâmetros:
    df (pandas.DataFrame): O DataFrame a ser filtrado.
    linguagem (str): A linguagem a ser usada para filtrar a coluna 'linguagem'.
    
    Retorno:
    pandas.DataFrame: O DataFrame filtrado contendo apenas as linhas com a linguagem especificada.
    """
    df_filtrado = df[df['linguagem'] == linguagem]
    return df_filtrado

# Função principal para processar os dados em pedaços (chunks)
def processar_chunks(file_path, output_path, chunksize=10000, nrows=805000, linguagem='es'):
    """
    Processa os dados em pedaços e classifica o sentimento dos comentários.

    Parâmetros:
    file_path (str): Caminho para o arquivo CSV de entrada.
    output_path (str): Caminho para o arquivo CSV de saída.
    chunksize (int): Tamanho do pedaço para carregar do CSV.
    nrows (int): Número total de linhas para processar.
    linguagem (str): Código do idioma para a classificação de sentimento (default é 'en').
    """
    start = 0
    df_all = pd.read_csv(file_path, chunksize=chunksize, sep=";", dtype=str, nrows=nrows)

    for df in df_all:
        start += 1

        # Filtrar os dados para a linguagem especificada antes de classificar os sentimentos
        df_filtrado = filtrar_df_linguagem(df, linguagem)

        # Classificar o sentimento para cada comentário no DataFrame filtrado
        df_filtrado['sentimento'] = df_filtrado['comments'].apply(lambda texto: classificar_sentimento(texto, linguagem))

        # Salva o chunk processado em um arquivo CSV
        df_filtrado.to_csv(output_path, sep=";", mode="a", index=False, header=(start == 1))

        # Mostra o progresso
        part = (start / (nrows / chunksize))  # Progresso baseado no número de chunks
        print(f"Parte {start}/{int(part)} concluída")

# Chamada da função principal para processar o arquivo
processar_chunks('data/raw_airbnb_reviews_langdet2.csv', 'data/raw_airbnb_reviews_sentimental_es.csv', linguagem='es')
