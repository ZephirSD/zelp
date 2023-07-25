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

Tout d'abord vous devez vérifier que dans le fichier `.env` que vous aviez defini

```text
    DATABASE_URL="mysql://root:root@127.0.0.1:3306/zelpData?charset=utf8mb4"
```

Ensuite, vous deviez créer la base de données `zelpData` avec la commande dans votre terminal de commande

```sh
    php bin/console doctrine:database:create
```

Dès que vous aviez crée la base de données, vous trouverez la base de données dans le dossier `db` que vous importerez dans la base de données `zelpData` dans un gestionnaire de base de données PhpMyAdmin ou autre

Si vous voulez partir de zero sans données, vous pouvez faire les commandes dans votre terminal de commande

```sh
    php bin/console make:migration
```

```sh
    php bin/console doctrine:migrations:migrate
```

## Etape 3: Démarrage du projet

Enfin lors que vous aviez effectué les éléments précedants vous pouvez démarrer le projet avec la commande dans votre terminal de commande

```sh
    symfony server:start
```

## Etape 4: Utilisation du projet

Nous avons deux utilsateurs de tests avec comme rôle `ROLE_USER` (pour le client) & `ROLE_RESTO` (pour le professionel)

##### Premier idendifiant

<ul>
    <li>Email: da@mail.com</li>
    <li>Mot de passe: test1234</li>
</ul>

##### Deuxième idendifiant

<ul>
    <li>Email: si@mail.re</li>
    <li>Mot de passe: test1234</li>
</ul>

## Listes des taches

- [x] Faire la page d’Accueil avec la liste des restaurants
- [x] Création du système d’authentification
- [x] De créer une entité User pour les rôles et les connexions
- [x] Création du système d’authentification
- [x] Faire le style de la page d’Inscription et de Connexion
- [x] Réalisation du style pour la partie Restaurant
- [ ] Faire un menu déroulant pour le menu Compte
- [ ] Réalisation du style pour les Avis
- [ ] Mise en place du système de commmentaire pour chaque restaurant
- [ ] Création du responsive pour le site
- [x] Résoudre le problème de `ville = null` lors de l'enregistrement d'un restaurant
