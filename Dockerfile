# Use a imagem base do Ruby
FROM ruby:3.2.1

# Instale dependências do sistema
RUN apt-get update && \
    apt-get install -y \
      build-essential \
      libpq-dev \
      nodejs \
      && rm -rf /var/lib/apt/lists/*

# Configura o diretório de trabalho
WORKDIR /home/app/web

# Copia o Gemfile e o Gemfile.lock para o container
COPY Gemfile Gemfile.lock ./

# Instala as gems
RUN bundle install --jobs 5 --retry 5

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta 3000 (padrão do Rails)
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["rails", "server", "-b", "0.0.0.0"]