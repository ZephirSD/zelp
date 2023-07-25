# Projet Zelp (En Formation) pour donner des avis sur des restaurants 

## Etape 1: Clonage du projet

Vous pouviez cloner le projet en utilisant 
```sh
    git clone https://github.com/ZephirSD/zelp.git
```

Après avoir cloné le projet sur votre ordinateur vous devez exécuté dans le terminal de commande

```sh
    composer install
```

## Etape 2: Base de données
Tout d'abord vous deviez créer la base de données `zelpData` avec la commande dans votre terminal de commande
```sh
    php bin/console doctrine:database:create
```

Puis pour créer les tables, vous deviez faire les commandes dans votre terminal de commande
```sh
    php bin/console make:migration
```
```sh
    php bin/console doctrine:migrations:migrate
```
Dès que vous aviez crée la base de données, vous trouverez la base de données dans le fichier `db` que vous pouviez importer dans un gestionnaire de base de données PhpMyAdmin ou autre.

## Etape 3: Démarrage du projet
Enfin lors que vous aviez effectué les éléments précedants vous pouvez démarrer le projet avec la commande dans votre terminal de commande
```sh
    symfony server:start
```
