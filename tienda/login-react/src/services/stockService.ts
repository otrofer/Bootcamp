

const API_URL = "http://localhost:8080/api";

export interface Stock {
  id: number;
  productoNombre: string;
  cantidad: number;
  usuario: {
    id: number;
    username: string;
  };
}

export interface StockInput {
  productoNombre: string;
  cantidad: number;
}

// Obtener todos los productos
export async function getAllStock(): Promise<Stock[]> {
  const token = localStorage.getItem("token");
  
  const response = await fetch(`${API_URL}/stock`, {
    headers: {
      "Authorization": `Bearer ${token}`
    }
  });

  if (!response.ok) {
    throw new Error("No se pudo obtener el dispositivo");
  }

  return response.json();
}

// Obtener un producto por ID
export async function getStockById(id: number): Promise<Stock> {
  const token = localStorage.getItem("token");
  
  const response = await fetch(`${API_URL}/stock/${id}`, {
    headers: {
      "Authorization": `Bearer ${token}`
    }
  });

  if (!response.ok) {
    throw new Error("Error al obtener el dispositivo");
  }

  return response.json();
}

// Crear nuevo producto
export async function createStock(stock: StockInput): Promise<Stock> {
  const token = localStorage.getItem("token");
  
  const response = await fetch(`${API_URL}/stock`, {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${token}`,
      "Content-Type": "application/json"
    },
    body: JSON.stringify(stock)
  });

  if (!response.ok) {
    throw new Error("Error al agregar el dispositivo");
  }

  return response.json();
}

// Actualizar producto
export async function updateStock(id: number, stock: StockInput): Promise<Stock> {
  const token = localStorage.getItem("token");
  
  const response = await fetch(`${API_URL}/stock/${id}`, {
    method: "PUT",
    headers: {
      "Authorization": `Bearer ${token}`,
      "Content-Type": "application/json"
    },
    body: JSON.stringify(stock)
  });

  if (!response.ok) {
    throw new Error("Error al actualizar el dispositivo, prueba de nuevo");
  }

  return response.json();
}

// Eliminar producto
export async function deleteStock(id: number): Promise<void> {
  const token = localStorage.getItem("token");
  
  const response = await fetch(`${API_URL}/stock/${id}`, {
    method: "DELETE",
    headers: {
      "Authorization": `Bearer ${token}`
    }
  });

  if (!response.ok) {
    throw new Error("Error al eliminar el dispositivo. ");
  }
}