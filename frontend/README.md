# React + Vite

## REGISTRO PRODUCTOS

```json
{
  "name": "Vajilla Wave Premium blanca",
  "description": "Vajilla Premium hecha con el sudor de mucha gente",
  "main_image": "https://www.todohogar.com/249252/vajilla-de-20-piezas-4-puestos-flor-haus.jpg",
  "images": [
    "https://www.imagen.com/vajilla-wave-spoon.jpg",
    "https://www.imagen.com/vajilla-wave-plate.jpg",
    "https://www.imagen.com/vajilla-wave-fork.jpg",
    "https://www.imagen.com/vajilla-wave-napkin.jpg"
  ],
  "categoryId": 1,
  "attributes": [1, 2], // SPRINT 2
  "price": 105
}
```

## GET PRODUCTOS

```json
{
  "id": 1,
  "name": "Vajilla Wave Premium blanca",
  "description": "Vajilla Premium hecha con el sudor de mucha gente",
  "main_image": "https://www.todohogar.com/249252/vajilla-de-20-piezas-4-puestos-flor-haus.jpg",
  "images": [
    "https://www.imagen.com/vajilla-wave-spoon.jpg",
    "https://www.imagen.com/vajilla-wave-plate.jpg",
    "https://www.imagen.com/vajilla-wave-fork.jpg",
    "https://www.imagen.com/vajilla-wave-napkin.jpg"
  ],
  "category": {
    "id": 1,
    "description": "Boda"
  },
  "attributes": [
    {
      "id": 1,
      "name": "Diseño elegante",
      "icon": "WeddingIcon"
    },
    {
      "id": 2,
      "name": "Cubiertos de acero inoxidable",
      "icon": "SteelIcon"
    }
  ],
  "price": 105
}
```

## GET ALL PRODUCTOS

```json
{
  "data": [
    {
      "id": 1,
      "name": "Vajilla Wave Premium blanca",
      "description": "Vajilla Premium hecha con el sudor de mucha gente",
      "images": [
        {
          "id": 1,
          "url": "https://www.imagen.com/vajilla-wave-1.jpg"
        },
        {
          "id": 2,
          "url": "https://www.imagen.com/vajilla-wave-spoon.jpg"
        },
        {
          "id": 3,
          "url": "https://www.imagen.com/vajilla-wave-plate.jpg"
        },
        {
          "id": 4,
          "url": "https://www.imagen.com/vajilla-wave-fork.jpg"
        },
        {
          "id": 5,
          "url": "https://www.imagen.com/vajilla-wave-napkin.jpg"
        }
      ],
      "category": {
        "id": 1,
        "description": "Boda"
      },
      "attributes": [
        {
          "id": 1,
          "name": "Diseño elegante",
          "icon": "WeddingIcon"
        },
        {
          "id": 2,
          "name": "Cubiertos de acero inoxidable",
          "icon": "SteelIcon"
        }
      ],
      "price": 105
    }
  ],
  "pageable": {
    "sort": {
      "unsorted": false,
      "empty": false,
      "sorted": true
    },
    "offset": 0,
    "pageNumber": 0,
    "pageSize": 10,
    "paged": true,
    "unpaged": false
  },
  "totalPages": 1,
  "totalElements": 1,
  "last": true,
  "numberOfElements": 1,
  "number": 0,
  "size": 10,
  "sort": {
    "unsorted": false,
    "empty": false,
    "sorted": true
  },
  "first": true,
  "empty": false
}
```
