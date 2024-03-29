# ENT - IUT de Montreuil - BD
Gestionnaire d'emploi du temps conçu pour l'IUT de Montreuil

## Installation

### Docker
Le docker compose doit être placer à la racine des 3 projet (voir les liens des autres repo)

Lancement du back (DockerFile BACK)
```bash
Docker run -d ismailskr/sae-back:latest
```
Lancement du front (DockerFile FRONT)
```bash
Docker run -d ismailskr/sae-front:latest
```

Docker compose :
```bash
Docker compose up –build
```

## Lien des autres repositories : 

[FRONT](https://github.com/DUT-Info-Montreuil/SAE-5.A-EntMontreuil-Front) : repo du front

[BD](https://github.com/DUT-Info-Montreuil/SAE-5.A-EntMontreuil-BD) : repo de la base de données PostgrSQL


## Architecture du projet

Les routes de l'API sont définies dans le dossier "controller", où la gestion des requêtes HTTP est orchestrée. Simultanément, le dossier "service" abrite les fonctionnalités métier de l'API, établissant une distinction claire entre la gestion des routes et la logique métier.

Quant au dossier "entities", il renferme les modèles SQLAlchemy, consolidant la gestion des entités et de la base de données associée. Ainsi, cette structuration favorise une séparation efficace entre les aspects liés aux routes, aux services et à la gestion des données au sein de l'API.

## 👷  Participants
• [@PriyankSolanki](https://github.com/PriyankSolanki) : Priyank Solanki

• [@stvenchg](https://github.com/stvenchg) : Steven Ching

• [@YanisTTC](https://github.com/YanisTTC) : Yanis Hamani

• [@ecyriaque](https://github.com/ecyriaque) : Emilio Cyriaque

• [@IsmailSKR](https://github.com/IsmailSKR) : Ismaïl Gada
