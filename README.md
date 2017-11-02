# Conteneurs Addok pour Docker

Ces images permettent de simplifier grandement la mise en place d'une instance [addok](https://github.com/addok/addok) avec les données de références diffusées par [Etalab](https://www.etalab.gouv.fr).

## Guides d'installation

Les guides suivants ont été rédigés pour un environnement Linux. Ils peuvent être adaptés pour Windows.

### Pré-requis

* [Docker CE 1.13.0+](https://docs.docker.com/engine/installation/)
* [Docker Compose](https://docs.docker.com/compose/install/) (recommandé)
* `unzip` ou équivalent
* `wget` ou équivalent

### Installer une instance avec les données de la Base Adresse Nationale en ODbL

#### Télécharger les données pré-indexées

```bash
wget https://adresse.data.gouv.fr/data/geocode/ban_odbl_addok-latest.zip
```

#### Décompresser l'archive

```bash
mkdir addok-data
unzip -d addok-data ban_odbl_addok-latest.zip
```

#### Télécharger le fichier Compose

```bash
wget https://raw.githubusercontent.com/etalab/addok-docker/master/docker-compose.yml
```

#### Démarrer l'instance

Suivant votre environnement, `sudo` peut être nécessaire pour les commandes suivantes.

```bash
# Attachée au terminal
docker-compose up

# ou en arrière-plan
docker-compose up -d
```
