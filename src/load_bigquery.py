from google.oauth2 import service_account
import os
import pandas as pd
from pandas_gbq import to_gbq

# Configurações do BigQuery e Caminho para as Credenciais
project_id = "airbnb-dbt"  # Substitua pelo ID do seu projeto
dataset_id = "airbnb_dbt"  # Nome do dataset onde as tabelas serão criadas
credentials_path = "airbnb/keyjson.json"  # Caminho para o arquivo JSON de credenciais

# Carregar as credenciais do arquivo JSON
credentials = service_account.Credentials.from_service_account_file(credentials_path)

# Caminho da pasta com os arquivos CSV
folder_path = "airbnb/data/"

# Percorre todos os arquivos na pasta especificada
for file_name in os.listdir(folder_path):
    if file_name.endswith("_sentimental_all.csv"):
        # Cria o caminho completo do arquivo
        file_path = os.path.join(folder_path, file_name)
        print(file_path)
        
        # Carrega o arquivo CSV como DataFrame
        df = pd.read_csv(file_path, sep=";",dtype=str)
        
        # Define o nome da tabela com base no nome do arquivo (sem a extensão .csv)
        table_name = file_name.replace(".csv", "")
        dataset_table = f"{dataset_id}.{table_name}"  # Nome no formato dataset.tabela

        # Carrega o DataFrame para o BigQuery
        try:
            to_gbq(
                df, 
                destination_table=dataset_table, 
                project_id=project_id, 
                credentials=credentials,  # Autenticação explícita
                if_exists="replace"
            )
            print(f"Tabela '{dataset_table}' carregada com sucesso no BigQuery!")
        except Exception as e:
            print(f"Erro ao carregar a tabela '{dataset_table}':", e)
