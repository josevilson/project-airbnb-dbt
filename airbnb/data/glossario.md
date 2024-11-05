# Tabela de Anúncios do Airbnb

| Campo                                     | Tipo       | Calculado | Descrição                                                                                      |
|-------------------------------------------|------------|-----------|------------------------------------------------------------------------------------------------|
| `id`                                      | Inteiro    |           | Identificador único do anúncio no Airbnb.                                                     |
| `listing_url`                             | Texto      | Sim       | URL do anúncio no Airbnb.                                                                     |
| `scrape_id`                               | BigInt     | Sim       | Identificador do "Scrape" do Airbnb ao qual este anúncio pertence.                            |
| `last_scraped`                            | Data/hora  | Sim       | UTC. Data e hora em que este anúncio foi "scrapeado".                                         |
| `source`                                  | Texto      |           | "Busca de bairro" ou "scrape anterior". Indica como o anúncio foi encontrado.                 |
| `name`                                    | Texto      |           | Nome do anúncio.                                                                              |
| `description`                             | Texto      |           | Descrição detalhada do anúncio.                                                               |
| `neighborhood_overview`                   | Texto      |           | Descrição do bairro fornecida pelo anfitrião.                                                 |
| `picture_url`                             | Texto      |           | URL da imagem principal do anúncio no Airbnb.                                                 |
| `host_id`                                 | Inteiro    |           | Identificador único do anfitrião/usuário no Airbnb.                                           |
| `host_url`                                | Texto      | Sim       | URL da página do anfitrião no Airbnb.                                                         |
| `host_name`                               | Texto      |           | Nome do anfitrião. Normalmente, apenas o primeiro nome.                                       |
| `host_since`                              | Data       |           | Data de criação do perfil do anfitrião.                                                       |
| `host_location`                           | Texto      |           | Localização do anfitrião conforme informado por ele mesmo.                                    |
| `host_about`                              | Texto      |           | Descrição sobre o anfitrião.                                                                  |
| `host_response_time`                      | Texto      |           | Tempo de resposta do anfitrião.                                                               |
| `host_response_rate`                      | Texto      |           | Taxa de resposta do anfitrião.                                                                |
| `host_acceptance_rate`                    | Texto      |           | Taxa de aceitação de reservas pelo anfitrião.                                                 |
| `host_is_superhost`                       | Booleano   |           | Indica se o anfitrião é um superhost (t = true; f = false).                                   |
| `host_thumbnail_url`                      | Texto      |           | URL da foto do anfitrião em miniatura.                                                        |
| `host_picture_url`                        | Texto      |           | URL da foto do anfitrião.                                                                     |
| `host_neighbourhood`                      | Texto      |           | Bairro do anfitrião.                                                                          |
| `host_listings_count`                     | Texto      |           | Número de anúncios do anfitrião.                                                              |
| `host_total_listings_count`               | Texto      |           | Total de anúncios do anfitrião.                                                               |
| `host_verifications`                      | Texto      |           | Verificações do perfil do anfitrião.                                                          |
| `host_has_profile_pic`                    | Booleano   |           | Indica se o anfitrião tem foto de perfil (t = true; f = false).                               |
| `host_identity_verified`                  | Booleano   |           | Indica se a identidade do anfitrião foi verificada (t = true; f = false).                     |
| `neighbourhood`                           | Texto      |           | Nome do bairro.                                                                               |
| `neighbourhood_cleansed`                  | Texto      | Sim       | Bairro geocodificado com base em latitude e longitude.                                        |
| `neighbourhood_group_cleansed`            | Texto      | Sim       | Grupo de bairros geocodificado com base em latitude e longitude.                              |
| `latitude`                                | Numérico   |           | Latitude com base no sistema geodésico mundial (WGS84).                                       |
| `longitude`                               | Numérico   |           | Longitude com base no sistema geodésico mundial (WGS84).                                      |
| `property_type`                           | Texto      |           | Tipo de propriedade, conforme informado pelo anfitrião.                                       |
| `room_type`                               | Texto      |           | Tipo de quarto: "Casa/Apto inteiro", "Quarto privado", "Quarto compartilhado" ou "Hotel".     |
| `accommodates`                            | Inteiro    |           | Capacidade máxima do anúncio.                                                                 |
| `bathrooms`                               | Numérico   |           | Número de banheiros no anúncio.                                                               |
| `bathrooms_text`                          | Texto      |           | Descrição textual dos banheiros no anúncio.                                                   |
| `bedrooms`                                | Inteiro    |           | Número de quartos.                                                                            |
| `beds`                                    | Inteiro    |           | Número de camas.                                                                              |
| `amenities`                               | JSON       |           | Lista de comodidades.                                                                         |
| `price`                                   | Moeda      |           | Preço diário em moeda local.                                                                  |
| `minimum_nights`                          | Inteiro    |           | Número mínimo de noites.                                                                      |
| `maximum_nights`                          | Inteiro    |           | Número máximo de noites.                                                                      |
| `minimum_minimum_nights`                  | Inteiro    | Sim       | Valor mínimo do campo minimum_nights (365 dias no futuro).                                    |
| `maximum_minimum_nights`                  | Inteiro    | Sim       | Valor máximo do campo minimum_nights (365 dias no futuro).                                    |
| `minimum_maximum_nights`                  | Inteiro    | Sim       | Valor mínimo do campo maximum_nights (365 dias no futuro).                                    |
| `maximum_maximum_nights`                  | Inteiro    | Sim       | Valor máximo do campo maximum_nights (365 dias no futuro).                                    |
| `minimum_nights_avg_ntm`                  | Numérico   | Sim       | Valor médio de minimum_nights (365 dias no futuro).                                           |
| `maximum_nights_avg_ntm`                  | Numérico   | Sim       | Valor médio de maximum_nights (365 dias no futuro).                                           |
| `calendar_updated`                        | Data       |           | Data da última atualização do calendário.                                                     |
| `has_availability`                        | Booleano   |           | Indica disponibilidade do anúncio (t = true; f = false).                                      |
| `availability_30`                         | Inteiro    | Sim       | Disponibilidade do anúncio para os próximos 30 dias.                                          |
| `availability_60`                         | Inteiro    | Sim       | Disponibilidade do anúncio para os próximos 60 dias.                                          |
| `availability_90`                         | Inteiro    | Sim       | Disponibilidade do anúncio para os próximos 90 dias.                                          |
| `availability_365`                        | Inteiro    | Sim       | Disponibilidade do anúncio para os próximos 365 dias.                                         |
| `calendar_last_scraped`                   | Data       |           | Data do último "scrape" do calendário.                                                        |
| `number_of_reviews`                       | Inteiro    |           | Número total de avaliações do anúncio.                                                        |
| `number_of_reviews_ltm`                   | Inteiro    | Sim       | Número de avaliações nos últimos 12 meses.                                                    |
| `number_of_reviews_l30d`                  | Inteiro    | Sim       | Número de avaliações nos últimos 30 dias.                                                     |
| `first_review`                            | Data       | Sim       | Data da primeira avaliação.                                                                   |
| `last_review`                             | Data       | Sim       | Data da última avaliação.                                                                     |
| `review_scores_rating`                    | Inteiro    |           | Nota média do anúncio.                                                                        |
| `review_scores_accuracy`                  | Inteiro    |           | Nota para precisão.                                                                           |
| `review_scores_cleanliness`               | Inteiro    |           | Nota para limpeza.                                                                            |
| `review_scores_checkin`                   | Inteiro    |           | Nota para check-in.                                                                           |
| `review_scores_communication`             | Inteiro    |           | Nota para comunicação.                                                                        |
| `review_scores_location`                  | Inteiro    |           | Nota para localização.                                                                        |
| `review_scores_value`                     | Inteiro    |           | Nota para valor.                                                                              |
| `license`                                 | Texto      |           | Número de licença/permissão/registro do anúncio.                                              |
| `instant_bookable`                        | Booleano   |           | Indica se é possível reservar automaticamente (t = true; f = false).                          |
| `calculated_host_listings_count`          | Inteiro    | Sim       | Número de anúncios do anfitrião no scrape atual.                                              |
| `calculated_host_listings_count_entire_homes` | Inteiro | Sim       | Número de anúncios de casa/apto inteiro do anfitrião no scrape atual.                         |
| `calculated_host_listings_count_private_rooms` | Inteiro | Sim       | Número de anúncios de quarto privado do anfitrião no scrape atual.                            |
| `calculated_host_listings_count_shared_rooms`  | Inteiro | Sim       | Número de anúncios de quarto compartilhado do anfitrião no scrape atual.                      |
| `reviews_per_month`                       | Numérico   | Sim       | Número médio de avaliações por mês do anúncio.                                                |
