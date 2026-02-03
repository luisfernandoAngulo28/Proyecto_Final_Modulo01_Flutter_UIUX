# Proyecto Final Módulo 01 - Flutter UI/UX
## Nike Shoe Store App

### ✅ Cumplimiento de Requisitos

Este proyecto cumple con **TODOS** los requisitos solicitados para la aplicación:

---

## 📱 **1. Navegación**

✅ **Implementado**

- **3 pantallas principales**: 
  - `signin_screen.dart` - Pantalla de Login/Registro
  - `home_screen.dart` - Pantalla de Explorar productos
  - `product_detail_screen.dart` - Pantalla de Detalle del producto

- **Código de navegación** en `home_screen.dart`:
  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailScreen(product: product),
    ),
  );
  ```

---

## 📤 **2. Enviar datos de una pantalla a otra**

✅ **Implementado**

- **Objeto Product completo** se pasa desde Home → Detail:
  ```dart
  ProductDetailScreen(product: product)
  ```

- **Datos enviados incluyen**:
  - ID del producto
  - Nombre y marca
  - Precio y descuento
  - Imágenes (múltiples URLs)
  - Colores disponibles
  - Tallas disponibles
  - Rating y número de reviews
  - Características del producto

---

## 🖼️ **3. Imágenes (URL, Assets)**

✅ **Implementado**

### **Imágenes desde URL**:
- Todas las imágenes de productos cargadas desde Amazon:
  ```dart
  Image.network(
    product.images[0],
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      return Center(child: Icon(Icons.image));
    },
  )
  ```
- 16 productos Nike con imágenes en alta resolución
- Galería de imágenes (3 fotos por producto)

### **Imágenes desde Assets**:
- Configuración de Firebase (logos)
- Estructura en `assets/images/`

---

## 📐 **4. Layouts (Column, Rows, Stack)**

✅ **Implementado**

### **Column**:
- Estructura principal del Home screen
- Layout del Product Detail screen
- Organización vertical de elementos

### **Row**:
- **Header del Home**:
  ```dart
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(Icons.menu),
      Text('Explore'),
      Stack(...) // Icono carrito con badge
    ],
  )
  ```
- **Categorías horizontales**: All Shoes, Outdoor, Tennis, Running
- **Ratings con estrellas**: ⭐ 4.6 (9576 reviews)
- **Precio con descuento**: BOB 624.50 | 15% OFF

### **Stack**:
- **Badge de notificación** en icono del carrito:
  ```dart
  Stack(
    children: [
      Container(...), // Icono
      Positioned(
        right: 8, top: 8,
        child: Container(...), // Badge rojo
      ),
    ],
  )
  ```
- **Overlays en Product Detail** para galería de imágenes

---

## 📋 **5. Listados**

✅ **Implementado**

### **GridView.builder** en `home_screen.dart`:
```dart
GridView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
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

### **Características del listado**:
- **16 productos Nike** cargados dinámicamente
- Grid de 2 columnas
- Scroll vertical
- Carga desde JSON Server (fake API REST)
- Actualización en tiempo real

---

## 🎁 **FUNCIONALIDADES EXTRAS**

Además de cumplir con todos los requisitos, el proyecto incluye:

### **Firebase Authentication**
- Login con email y password
- Registro de nuevos usuarios
- Validación de credenciales
- Almacenamiento del nombre completo
- Cuenta de prueba: batman@wayneenterprises.com

### **Búsqueda Funcional**
- Búsqueda en tiempo real
- Filtro por nombre, marca y descripción
- Icono de limpiar búsqueda

### **Filtros por Categoría**
- All Shoes (todos)
- Outdoor
- Tennis
- Running
- Filtrado dinámico del listado

### **JSON Server (Fake API REST)**
- Servidor local en `http://localhost:3000`
- Base de datos en `db.json`
- HTTP requests con paquete `http ^1.2.2`
- Manejo de errores y loading states

### **UI/UX Profesional**
- Ratings con estrellas ⭐
- Badges de "BEST SELLER"
- Indicadores de descuento
- Contador de productos ("16 items")
- Mensajes de "No products found"
- Diseño limpio y moderno

### **Product Detail Screen Completo**
- Galería de imágenes con thumbnails
- Selector de tallas (7 - 13)
- Selector de colores
- Lista de características
- Rating y reviews
- Botón "Agregar al Carrito"

---

## 📦 **Tecnologías Utilizadas**

- **Flutter** - Framework principal
- **Firebase Authentication** - Sistema de login
- **JSON Server** - Fake REST API
- **HTTP Package** - Peticiones HTTP
- **Chrome** - Plataforma de ejecución

---

## 🚀 **Cómo Ejecutar el Proyecto**

1. **Instalar dependencias**:
   ```bash
   flutter pub get
   ```

2. **Iniciar JSON Server**:
   ```bash
   json-server db.json
   ```

3. **Ejecutar la aplicación**:
   ```bash
   flutter run -d chrome
   ```

4. **Credenciales de prueba**:
   - Email: `batman@wayneenterprises.com`
   - Password: `batman123`

---

## 📊 **Estructura del Proyecto**

```
lib/
├── main.dart                          # Punto de entrada
├── firebase_options.dart              # Configuración Firebase
├── models/
│   └── product.dart                   # Modelos Product y Category
├── services/
│   └── product_service.dart           # Servicio HTTP
└── screens/
    ├── signin_screen.dart             # Login/Registro
    ├── home_screen.dart                # Listado de productos
    └── product_detail_screen.dart     # Detalle del producto

db.json                                 # Base de datos con 16 productos Nike
```

---

## ✨ **Resultado Final**

El proyecto es una **tienda de zapatillas Nike completamente funcional** que:
- ✅ Cumple con **TODOS** los requisitos solicitados
- ✅ Incluye funcionalidades profesionales adicionales
- ✅ Tiene un diseño UI/UX moderno y atractivo
- ✅ Está completamente funcional y probado en Chrome

---

**Desarrollado por:** Luis Fernando Angulo  
**Repositorio:** [GitHub - Proyecto_Final_Modulo01_Flutter_UIUX](https://github.com/luisfernandoAngulo28/Proyecto_Final_Modulo01_Flutter_UIUX)
