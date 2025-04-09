# README

Simple finance project

## Construa os containers

docker-compose build

## Instale as gems (caso dê erro de dependência):

docker-compose run web bundle install

## Crie o banco de dados

docker-compose run web rails db:create

## Rodar migrações

docker-compose run web rails db:migrate

## Rodar projeto

docker-compose up
