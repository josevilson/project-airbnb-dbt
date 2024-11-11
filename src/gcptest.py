from google.oauth2 import service_account
from google.cloud import bigquery

# Configurações do BigQuery e Caminho para as Credenciais
project_id = "airbnb-dbt"
credentials_path = "airbnb/keyjson.json"

# Carregar as credenciais do arquivo JSON
credentials = service_account.Credentials.from_service_account_file(credentials_path)

# Instanciar o cliente BigQuery
client = bigquery.Client(credentials=credentials, project=project_id)

# Testar a conexão listando datasets no projeto
datasets = list(client.list_datasets())  # Deve listar datasets no projeto

if datasets:
    print("Conexão bem-sucedida! Datasets encontrados:")
    print(datasets)
    for dataset in datasets:
        print(dataset.dataset_id)
else:
    print("Nenhum dataset encontrado. Conexão bem-sucedida, mas o projeto está vazio.")
