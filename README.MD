# Fullstack Dockerized Project

Este proyecto es un ejemplo de una aplicación fullstack dockerizada para desarrollo, que integra:

- **Frontend:** Aplicación React utilizando Vite, con pnpm como manejador de paquetes.
- **Backend:** API REST con Spring Boot, utilizando Java 21 y Maven.
- **Base de Datos:** PostgreSQL.

Se utiliza Docker Compose para orquestar los servicios y Docker Volumes para permitir que los cambios en el código se reflejen sin necesidad de reconstruir las imágenes.

---

## Tabla de Contenidos

- [Estructura del Proyecto](#estructura-del-proyecto)
- [Requisitos](#requisitos)
- [Configuración y Ejecución](#configuración-y-ejecución)
- [Desarrollo](#desarrollo)
  - [Frontend (React/Vite con pnpm)](#frontend-reactvite-con-pnpm)
  - [Backend (Spring Boot con Java 21)](#backend-spring-boot-con-java-21)
  - [PostgreSQL](#postgresql)
- [Solución de Problemas](#solución-de-problemas)
- [Notas Adicionales](#notas-adicionales)
- [Licencia](#licencia)

---

## Estructura del Proyecto

```plaintext
/fullstack-project
├── docker-compose.yml        # Orquesta los servicios (frontend, backend y postgres)
├── frontend                  # Proyecto React/Vite
│   ├── Dockerfile
│   ├── package.json
│   ├── pnpm-lock.yaml        # Opcional (se recomienda incluirlo para instalaciones deterministas)
│   ├── vite.config.js
│   ├── index.html           # Archivo HTML principal (raíz del proyecto o configurado en vite.config.js)
│   └── src
│       ├── App.jsx
│       └── main.jsx
└── backend                   # Proyecto Spring Boot
    ├── Dockerfile
    ├── pom.xml
    └── src
        └── main
            ├── java
            │   └── com
            │       └── example
            │           └── demo
            │               ├── DemoApplication.java
            │               └── controller
            │                   └── TestController.java
            └── resources
                └── application.properties
```
