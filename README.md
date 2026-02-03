# Proyecto Final Módulo 01 - Flutter UI/UX
## 👟 Nike Shoe Store App

Tienda de zapatillas Nike completamente funcional desarrollada con Flutter, Firebase Authentication y JSON Server como fake REST API.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

---

## 📋 Tabla de Contenidos

- [Cumplimiento de Requisitos](#-cumplimiento-de-requisitos)
- [Características](#-características)
- [Tecnologías Utilizadas](#-tecnologías-utilizadas)
- [Instalación](#-instalación)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Capturas de Pantalla](#-capturas-de-pantalla)
- [Autor](#-autor)

---

## ✅ Cumplimiento de Requisitos

Este proyecto cumple con **TODOS** los requisitos solicitados:

### 📱 1. **Navegación**
✅ Implementado con 3 pantallas:
- `signin_screen.dart` - Login/Registro
- `home_screen.dart` - Explorar productos  
- `product_detail_screen.dart` - Detalle del producto

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProductDetailScreen(product: product),
  ),
);
```

### 📤 2. **Enviar datos de una pantalla a otra**
✅ Objeto `Product` completo pasado entre pantallas:
- ID, nombre, marca, precio, descuento
- Múltiples imágenes (URLs)
- Colores y tallas disponibles
- Rating, reviews y características

### 🖼️ 3. **Imágenes (URL, Assets)**
✅ Implementado:
- **URLs**: 16 productos Nike con imágenes desde Amazon
- **Assets**: Logos y recursos de Firebase
- Manejo de errores con `errorBuilder`

```dart
Image.network(
  product.images[0],
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) => Icon(Icons.image),
)
```

### 📐 4. **Layouts (Column, Rows, Stack)**
✅ Todos implementados:

**Column**: Estructura principal de todas las pantallas

**Row**: 
- Header con menú, título y carrito
- Categorías (All Shoes, Outdoor, Tennis, Running)
- Ratings con estrellas ⭐
- Precio con descuentos

**Stack**:
- Badge de notificación en carrito
- Overlays en galería de imágenes

```dart
Stack(
  children: [
    Container(...), // Icono carrito
    Positioned(
      right: 8, top: 8,
      child: Container(...), // Badge rojo
    ),
  ],
)
```

### 📋 5. **Listados**
✅ GridView con 16 productos:

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: 0.65,
  ),
  itemCount: displayedProducts.length,
  itemBuilder: (context, index) {
    return _buildProductCard(displayedProducts[index]);
  },
)
```

---

## 🎁 Características

### ✨ Funcionalidades Core
- 🔐 **Firebase Authentication**: Login y registro de usuarios
- 🔍 **Búsqueda en tiempo real**: Filtra por nombre, marca o descripción
- 🏷️ **Filtros por categoría**: All Shoes, Outdoor, Tennis, Running
- 🛍️ **16 productos Nike**: Con imágenes, precios y detalles completos
- ⭐ **Ratings y reviews**: Sistema de calificaciones
- 🎨 **Badges dinámicos**: BEST SELLER y descuentos

### 🛒 Product Detail
- 🖼️ **Galería de imágenes**: 3 fotos por producto con thumbnails
- 👕 **Selector de tallas**: 7 - 13
- 🎨 **Selector de colores**: Múltiples opciones
- 📝 **Características detalladas**: Lista completa de features
- 💰 **Precios con descuentos**: Cálculo automático

### 🎯 UX/UI
- 📱 Diseño responsive
- 🎨 Interfaz moderna y limpia
- ⚡ Carga rápida con loading states
- 🚫 Mensajes de "No products found"
- 📊 Contador de productos ("16 items")

---

## 🛠️ Tecnologías Utilizadas

| Tecnología | Uso |
|-----------|-----|
| **Flutter** | Framework principal |
| **Dart** | Lenguaje de programación |
| **Firebase Authentication** | Sistema de autenticación |
| **JSON Server** | Fake REST API |
| **HTTP Package** | Peticiones HTTP (^1.2.2) |
| **Chrome** | Plataforma de desarrollo/testing |

---

## 🚀 Instalación

### Prerrequisitos
- Flutter SDK instalado
- Node.js y npm (para json-server)
- Chrome browser

### Pasos

1. **Clonar el repositorio**:
```bash
git clone https://github.com/luisfernandoAngulo28/Proyecto_Final_Modulo01_Flutter_UIUX.git
cd Proyecto_Final_Modulo01_Flutter_UIUX
```

2. **Instalar dependencias de Flutter**:
```bash
flutter pub get
```

3. **Instalar JSON Server** (si no lo tienes):
```bash
npm install -g json-server
```

4. **Iniciar JSON Server**:
```bash
json-server db.json
```
El servidor correrá en `http://localhost:3000`

5. **Ejecutar la aplicación**:
```bash
flutter run -d chrome
```

### 🔑 Credenciales de Prueba
- **Email**: `batman@wayneenterprises.com`
- **Password**: `batman123`

O crea una cuenta nueva en la app.

---

## 📁 Estructura del Proyecto

```
lib/
├── main.dart                          # Punto de entrada, inicialización Firebase
├── firebase_options.dart              # Configuración Firebase (Web & Android)
├── models/
│   └── product.dart                   # Modelos Product y Category
├── services/
│   └── product_service.dart           # Servicio HTTP para productos
└── screens/
    ├── signin_screen.dart             # Pantalla Login/Registro
    ├── home_screen.dart                # Pantalla principal con grid de productos
    └── product_detail_screen.dart     # Detalle completo del producto

db.json                                 # Base de datos con 16 productos Nike
README.md                               # Este archivo
REQUISITOS_PROYECTO.md                 # Documentación detallada de requisitos
```

---

## 📸 Capturas de Pantalla

### Login Screen
- Dual-mode (Sign In / Create Account)
- Validación de Firebase
- Manejo de errores

### Home Screen
- Grid de 2 columnas
- Búsqueda funcional
- Filtros por categoría
- 16 productos Nike

### Product Detail
- Galería de imágenes
- Selector de tallas y colores
- Rating y reviews
- Botón "Agregar al Carrito"

---

## 🏆 Funcionalidades Destacadas

### 🔍 Búsqueda Inteligente
```dart
void searchProducts(String query) {
  setState(() {
    displayedProducts = products.where((product) {
      return product.name.toLowerCase().contains(query) ||
             product.brand.toLowerCase().contains(query) ||
             product.description.toLowerCase().contains(query);
    }).toList();
  });
}
```

### 🏷️ Filtros Dinámicos
```dart
void filterByCategory(String category) {
  setState(() {
    selectedCategory = category;
    if (category == 'All Shoes') {
      displayedProducts = products;
    } else {
      displayedProducts = products.where((product) {
        final features = product.features.join(' ').toLowerCase();
        return features.contains(category.toLowerCase());
      }).toList();
    }
  });
}
```

---

## 🔧 Configuración de Firebase

El proyecto incluye configuración para:
- ✅ **Android**: `android/app/google-services.json`
- ✅ **Web**: `lib/firebase_options.dart`
- ⚠️ **Windows**: No configurado (requiere credenciales adicionales)

---

## 📊 Base de Datos (db.json)

Estructura:
```json
{
  "categories": [
    {
      "id": "1",
      "name": "calzado",
      "products": [
        {
          "id": 1,
          "name": "Nike Zapatillas Air Force 1 '07 para hombre",
          "brand": "Nike",
          "price": 624.50,
          "currency": "BOB",
          "discount": 15,
          "rating": 4.6,
          "reviews": 9576,
          "colors": ["Blanco", "Negro", "Triple Blanco"],
          "sizes": ["7", "7.5", "8", "8.5", "9", "9.5", "10", "11", "12"],
          "images": [...],
          "features": [...]
        }
        // ... 15 productos más
      ]
    }
  ]
}
```

---

## 🐛 Solución de Problemas

### Error: No se cargan los productos
**Solución**: Verifica que json-server esté corriendo:
```bash
json-server db.json
```

### Error: Firebase not configured for Windows
**Solución**: Ejecuta en Chrome:
```bash
flutter run -d chrome
```

### Error: CORS en navegador
**Solución**: JSON Server debe correr en `localhost:3000` (no usar IP)

---

## 📝 Notas de Desarrollo

- **Plataforma recomendada**: Chrome (mejor soporte para Firebase Web)
- **Puerto JSON Server**: 3000 (configurable en `product_service.dart`)
- **Responsive**: Optimizado para pantallas de escritorio
- **Hot Reload**: Totalmente compatible

---

## 🎓 Aprendizajes Aplicados

Este proyecto demuestra dominio de:
- ✅ Navegación entre pantallas
- ✅ Paso de datos entre widgets
- ✅ Manejo de imágenes (URL y Assets)
- ✅ Layouts complejos (Column, Row, Stack, Grid)
- ✅ Listas dinámicas con builders
- ✅ HTTP requests y APIs REST
- ✅ State management con StatefulWidget
- ✅ Firebase Authentication
- ✅ Manejo de formularios
- ✅ UX/UI profesional

---

## 🤝 Contribuciones

Este es un proyecto académico, pero las sugerencias son bienvenidas. Puedes:
- 🐛 Reportar bugs
- 💡 Sugerir nuevas características
- 📖 Mejorar la documentación

---

## 📄 Licencia

Este proyecto fue desarrollado con fines educativos como parte del Módulo 01 del curso de Flutter.

---

## 👨‍💻 Autor

**Luis Fernando Angulo**

- GitHub: [@luisfernandoAngulo28](https://github.com/luisfernandoAngulo28)
- Proyecto: [Proyecto_Final_Modulo01_Flutter_UIUX](https://github.com/luisfernandoAngulo28/Proyecto_Final_Modulo01_Flutter_UIUX)

---

## 🙏 Agradecimientos

- Documentación oficial de Flutter
- Comunidad de Firebase
- Recursos de diseño UI/UX
- Imágenes de productos de Amazon

---

⭐ Si este proyecto te fue útil, no olvides darle una estrella en GitHub!
