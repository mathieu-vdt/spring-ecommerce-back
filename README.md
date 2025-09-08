# 🛠️ Spring Boot E-commerce API

Backend REST API développé avec **Spring Boot** pour gérer un site e-commerce (produits, utilisateurs, commandes).  
Il est connecté au frontend Angular : [mathieu-vdt/angular-ecommerce](https://github.com/mathieu-vdt/angular-ecommerce).

---

## 🚀 Démo

- **Backend API (Render)** : [https://spring-ecommerce-back.onrender.com/api/products](https://spring-ecommerce-back.onrender.com/api/products)  
⚠️ En mode gratuit sur Render, l’API se met en "sleep" lorsqu’elle est inactive.  
👉 Pensez à l’ouvrir une fois avant d’utiliser le frontend.

- **Frontend (Angular GitHub Pages)** : [https://mathieu-vdt.github.io/angular-ecommerce/](https://mathieu-vdt.github.io/angular-ecommerce/)

---

## ✨ Fonctionnalités

- **Produits**
  - Récupération de tous les produits
  - Détails d’un produit
  - Création, mise à jour, suppression (CRUD, réservé aux admins)

- **Utilisateurs**
  - Inscription
  - Connexion
  - Gestion CRUD (admin)

- **Commandes**
  - Création de commandes
  - Récupération de l’historique
  - Gestion CRUD (admin)

- **Sécurité**
  - Authentification basique avec rôles (`USER`, `ADMIN`)
  - Accès à la partie administration uniquement pour les comptes `ADMIN`

---

## 📡 Endpoints principaux

### Produits
| Méthode | Endpoint              | Description                 | Authentification |
|---------|-----------------------|-----------------------------|------------------|
| GET     | `/api/products`       | Liste de tous les produits  | ❌               |
| GET     | `/api/products/{id}`  | Détail d’un produit         | ❌               |
| POST    | `/api/products`       | Créer un produit            | ✅ (ADMIN)       |
| PUT     | `/api/products/{id}`  | Modifier un produit         | ✅ (ADMIN)       |
| DELETE  | `/api/products/{id}`  | Supprimer un produit        | ✅ (ADMIN)       |

### Utilisateurs
| Méthode | Endpoint              | Description                | Authentification |
|---------|-----------------------|----------------------------|------------------|
| POST    | `/api/auth/register`  | Créer un utilisateur       | ❌               |
| POST    | `/api/auth/login`     | Connexion utilisateur      | ❌               |
| GET     | `/api/users`          | Liste des utilisateurs     | ✅ (ADMIN)       |
| DELETE  | `/api/users/{id}`     | Supprimer un utilisateur   | ✅ (ADMIN)       |

### Commandes
| Méthode | Endpoint              | Description                | Authentification |
|---------|-----------------------|----------------------------|------------------|
| GET     | `/api/orders`         | Liste des commandes        | ✅ (ADMIN)       |
| POST    | `/api/orders`         | Créer une commande         | ✅ (USER/ADMIN)  |
| DELETE  | `/api/orders/{id}`    | Supprimer une commande     | ✅ (ADMIN)       |

---

## 🛠️ Stack technique

- [Spring Boot](https://spring.io/projects/spring-boot)
- [Spring Data JPA](https://spring.io/projects/spring-data-jpa)
- [Hibernate](https://hibernate.org/)
- [Spring Security](https://spring.io/projects/spring-security)
- Base de données (SQLite en dev, PostgreSQL conseillé en prod)

---

## 📦 Installation locale

### 1) Cloner le repo
```bash
git clone https://github.com/mathieu-vdt/spring-ecommerce-back.git
cd spring-ecommerce-back

## 2) Configuration base de données

**Option A — SQLite (développement)**  
Dans `src/main/resources/application.properties` :
```properties
spring.datasource.url=jdbc:sqlite:data/ecommerce.db
spring.datasource.driver-class-name=org.sqlite.JDBC
spring.jpa.hibernate.ddl-auto=update
```

**Option B — PostgreSQL (production / Render)**  
Toujours dans `src/main/resources/application.properties` (ou via variables d’environnement en prod) :
```properties
spring.datasource.url=jdbc:postgresql://<host>:<port>/<db>
spring.datasource.username=<user>
spring.datasource.password=<password>
spring.datasource.driver-class-name=org.postgresql.Driver
spring.jpa.hibernate.ddl-auto=update
```

> En prod, utilisez de préférence les variables d’environnement :
> `SPRING_DATASOURCE_URL`, `SPRING_DATASOURCE_USERNAME`, `SPRING_DATASOURCE_PASSWORD`, `SPRING_DATASOURCE_DRIVER_CLASS_NAME`.

---

## 3) Lancer l’application

**Avec Maven Wrapper :**
```bash
./mvnw spring-boot:run
```

**Avec Gradle Wrapper :**
```bash
./gradlew bootRun
```

Application disponible sur :  
https://spring-ecommerce-back.onrender.com/api/products

---

## 4) (Optionnel) Lancer avec Docker

**Construire l’image :**
```bash
docker build -t spring-ecommerce-back .
```

**Démarrer avec SQLite (données locales persistées) :**
```bash
mkdir -p data
docker run -p 8080:8080 \
  -v "$PWD/data:/app/data" \
  -e SPRING_DATASOURCE_URL=jdbc:sqlite:/app/data/ecommerce.db \
  spring-ecommerce-back
```

**Démarrer avec PostgreSQL :**
```bash
docker run -p 8080:8080 \
  -e SPRING_DATASOURCE_URL=jdbc:postgresql://<host>:<port>/<db> \
  -e SPRING_DATASOURCE_USERNAME=<user> \
  -e SPRING_DATASOURCE_PASSWORD=<password> \
  -e SPRING_DATASOURCE_DRIVER_CLASS_NAME=org.postgresql.Driver \
  spring-ecommerce-back
```
