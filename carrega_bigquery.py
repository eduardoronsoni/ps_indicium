import os
import pandas as pd
from google.cloud import bigquery
from google.oauth2 import service_account

# Credenciais do BigQuery
file_path = 'C://Users//eduardo.ronsoni//Documents//ps_indicium//ps-indicium-437714-25244b6755d3.json'
creds = service_account.Credentials.from_service_account_file(file_path)
client = bigquery.Client(credentials=creds, project='ps-indicium-437714')

# Dados do projeto no BigQuery
dataset = 'raw_erp'

# Caminho da pasta local onde estão os dados
folder_path = 'C://Users//eduardo.ronsoni//Documents//ps_indicium//dados'

# Itera sobre o conteúdo da pasta
for file in os.listdir(folder_path):
    if file.endswith('.csv'):  # Filtra apenas os arquivos de extensão .csv
        file_path = os.path.join(folder_path, file)  # Caminho completo do arquivo
        print(f"Lendo o arquivo: {file}")

        # Lê o arquivo CSV com o delimitador correto (ajuste se necessário)
        df = pd.read_csv(file_path, delimiter=';')  # Use ';' se for o delimitador correto

        # Remove a extensão .csv do nome do arquivo para usar como nome da tabela
        table_name = os.path.splitext(file)[0]  # Nome da tabela sem a extensão

        # Renomeia as colunas se necessário (ex: substitui caracteres inválidos)
        df.columns = df.columns.str.replace(';', '_', regex=False)  # Substitui ';' por '_'
        df.columns = df.columns.str.replace(' ', '_', regex=False)  # Substitui espaços por '_'

        # Envia o DataFrame para o BigQuery
        df.to_gbq(destination_table=f'{dataset}.{table_name}', 
                   project_id='ps-indicium-437714', 
                   if_exists='replace',  # Substitui a tabela se ela já existir
                   credentials=creds)

        print(f"Tabela {table_name} enviada com sucesso ao BigQuery.")
