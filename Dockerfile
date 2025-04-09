FROM ruby:3.1.0

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y build-essential nodejs postgresql-client

# Cria diretório da app
WORKDIR /simple-finance

# Copia os arquivos de dependência
COPY Gemfile Gemfile.lock ./

# Instala bundler e gems
RUN gem install bundler && bundle install

# Copia todo o projeto
COPY . .

# Adiciona permissão e define script de entrada
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Porta padrão
EXPOSE 3000

# Comando padrão
CMD ["rails", "server", "-b", "0.0.0.0"]
