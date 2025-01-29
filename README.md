# 📊 Data Warehouse & NoSQL Project

## 🏆 Objectif
Le but de ce projet est de concevoir et implémenter un Data Warehouse (DW) et d'explorer l'utilisation des technologies NoSQL pour gérer des données hétérogènes. Nous utilisons **Neo4j** et **Cypher** pour la représentation des données sous forme de graphes.

## 📌 Fonctionnalités principales
- Intégration et transformation de données provenant de sources hétérogènes
- Modélisation des données sous forme de graphe dans Neo4j
- Requêtage avancé avec Cypher
- Visualisation des relations et exploration des données
- Analyse de clustering et gestion de Big Data

## 🛠 Technologies utilisées
- **Neo4j** : Base de données orientée graphe
- **Cypher** : Langage de requête pour Neo4j
- **Python** : Pour l'extraction et le traitement des données
- **Pandas** : Manipulation des données tabulaires
- **Graph Data Science (GDS)** : Pour l'analyse avancée des graphes

## 📂 Structure du projet
```
📦 data-warehouse-project
 ┣ 📂 data                # Jeux de données utilisés
 ┣ 📂 scripts             # Scripts de transformation et de chargement
 ┣ 📂 notebooks           # Analyses et visualisations sous Jupyter
 ┣ 📂 neo4j               # Configuration et requêtes Cypher
 ┣ 📜 README.md           # Documentation du projet
 ┣ 📜 requirements.txt    # Dépendances Python
```

## 📥 Installation
### 1️⃣ Prérequis
- [Neo4j Desktop](https://neo4j.com/download/) ou Docker
- Python 3.8+

### 2️⃣ Installation des dépendances
```bash
pip install -r requirements.txt
```

### 3️⃣ Lancer Neo4j
#### Avec Neo4j Desktop :
- Créez une base de données locale
- Configurez les identifiants (**neo4j / password**)
- Activez le plugin Graph Data Science (GDS)

## 🚀 Utilisation
### Charger les données dans Neo4j
Exécutez le script de chargement des données :
```bash
python scripts/load_data.py
```

### Exécuter des requêtes Cypher
Accédez à Neo4j Browser et testez des requêtes comme :
```cypher
MATCH (n) RETURN n LIMIT 10;
```

## 📈 Analyse et Visualisation
Les notebooks Jupyter contiennent des analyses de clustering et de visualisation des graphes. Pour les exécuter :
```bash
jupyter notebook
```

## 📌 Auteurs
- **Nom 1** (@GuillaumeDeSaintEtienne)
- **Nom 2** (@MaelGalliou)
- **Nom 3** (@Sachafrft)
- **Nom 4** (@emiliengodet)

## 📜 Licence
Ce projet est sous licence MIT. Vous êtes libre de l'utiliser et de le modifier selon vos besoins.

---
🚀 **Bon projet et bonne exploration des données !**
