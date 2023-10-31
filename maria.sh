#!/bin/bash

# Nom du projet

read -p "Le nom du projet : " project_name

# Mot de passe Aléatoire

password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)


# Création de la BDD

mysql -u root -e "CREATE DATABASE $project_name;"


# Création de l'utilisateur avec MDP aléatoire

mysql -u root -e "CREATE USER $project_name'@'localhost' IDENTIFIED BY '$password';"

# Donner à l'utilisateur les droits

mysql -u root -e "GRANT ALL PRIVILEGES ON $project_name.* TO '$project_name'@'localhost';"

# Récapitulatif 

echo "Base de données '$project_name' créée"
echo "Utilisateur '$project_name' créé avec le mot de passe : $password"