# 📊 Data Warehouse & NoSQL Project

## 🏆 Objective
The goal of this project is to design and implement a Data Warehouse (DW) and explore the use of NoSQL technologies to manage heterogeneous data. We use **Neo4j** and **Cypher** for graph-based data representation.

## 📌 Key Features
- Data integration and transformation from heterogeneous sources
- Data modeling in graph form in Neo4j
- Advanced querying with Cypher
- Visualization of relationships and data exploration
- Clustering analysis and Big Data management

## 🛠 Technologies Used
- **Neo4j**: Graph database
- **Cypher**: Query language for Neo4j
- **Python**: For data extraction and processing
- **Pandas**: For handling tabular data
- **Graph Data Science (GDS)**: For advanced graph analysis

## 📂 Project Structure

## 📂 Structure du projet
```
📦 data-warehouse-project
 ┣ 📂 SQL                # Queries for the Data Warehouse
 ┣ 📂 df_for_Neo4j       # Relations and Nodes for Cypher
 ┣ 📜 README.md          # Documentation of the project
 ┣ 📜 requirements.txt   # Python requirements
 ┣ 📜 graph.cypher       # Queries for cypher
 ┣ 📜 ml2.ipynb          # Machine learning for k-means algo
 ┣ 📜 prep_bdd.ipynb     
 ┣ 📜 schema.md          # Star Schema for data integration
 ┣ 📜 viz2.ipynb         # Data visualization
```

## 📥 Installation
### 1️⃣ Prerequisites
- [Neo4j Desktop](https://neo4j.com/download/)
- Python 3.8+

### 2️⃣ Install Dependencies
```bash
pip install -r requirements.txt
```

### 3️⃣ Running Neo4j
#### Using Neo4j Desktop:
- Create a local database
- Set the credentials (**neo4j / password**)
- Enable the Graph Data Science (GDS) plugin

## 🚀 Usage
### Loading Data into Neo4j
Run the data loading script:
```bash
python scripts/load_data.py
```

### Running Cypher Queries
Access Neo4j Browser and run queries like:
```cypher
MATCH (n) RETURN n LIMIT 10;
```

## 📈 Data Analysis and Visualization
The Jupyter notebooks contain clustering analysis and graph visualizations. To run them:
```bash
jupyter notebook
```

## 📌 Authors
- **Nom 1** (@GuillaumeDeSaintEtienne)
- **Nom 2** (@MaelGalliou)
- **Nom 3** (@Sachafrft)
- **Nom 4** (@emiliengodet)

## 📜 Licence
This project is licensed under the MIT License. You are free to use and modify it as needed.

---
🚀 **Happy project and enjoy data exploration !**
