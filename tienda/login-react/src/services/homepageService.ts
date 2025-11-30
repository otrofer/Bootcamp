
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

export interface UsuarioDTO {
  id: number;
  username: string;
  email?: string;
  rol: string;
}

export interface DashboardStats {
  totalProductos: number;
  stockBajo: number;
  totalUsuarios: number;
}

export interface Activity {
  id: number;
  tipo: 'stock' | 'usuario' | 'otro';
  titulo: string;
  tiempo: string;
}

// Obtener todos los productos/stock
export async function getStock(): Promise<Stock[]> {
  const token = localStorage.getItem("token");
  
  const response = await fetch(`${API_URL}/stock`, {
    headers: {
      "Authorization": `Bearer ${token}`
    }
  });

  if (!response.ok) {
    throw new Error("Error al obtener stock");
  }

  return response.json();
}

// Obtener todos los usuarios (solo ADMIN)
export async function getUsuarios(): Promise<UsuarioDTO[]> {
  const token = localStorage.getItem("token");
  
  const response = await fetch(`${API_URL}/usuarios`, {
    headers: {
      "Authorization": `Bearer ${token}`
    }
  });

  if (!response.ok) {
    throw new Error("Error al obtener usuarios");
  }

  return response.json();
}

// Calcular estadísticas del dashboard
export async function getDashboardStats(): Promise<DashboardStats> {
  try {
    const stock = await getStock();
    
    // Total de productos (dispositivos)
    const totalProductos = stock.length;
    
    // Productos con stock bajo (menos de 3 unidades)
    const stockBajo = stock.filter(item => item.cantidad < 3).length;
    
    // Total de usuarios (si es que tiene permisos)
    let totalUsuarios = 0;
    try {
      const usuarios = await getUsuarios();
      totalUsuarios = usuarios.length;
    } catch {
      console.log("No tienes permisos para ver usuarios");
    }
    
    return {
      totalProductos,
      stockBajo,
      totalUsuarios
    };
  } catch (error) {
    console.error("Error calculando estadísticas:", error);
    throw error;
  }
}

// Generar actividad reciente desde el stock
export async function getRecentActivity(): Promise<Activity[]> {
  try {
    const stock = await getStock();
    const activities: Activity[] = [];
    
    // Productos con stock bajo
    stock
      .filter(item => item.cantidad < 10 && item.cantidad > 0)
      .slice(0, 3)
      .forEach((item, index) => {
        activities.push({
          id: item.id + index,
          tipo: 'stock',
          titulo: `Cantidad: ${item.productoNombre} (${item.cantidad} unidades)`,
          tiempo: 'Hace 1 hora'
        });
      });
    
    // Productos sin stock
    stock
      .filter(item => item.cantidad === 0)
      .slice(0, 2)
      .forEach((item, index) => {
        activities.push({
          id: item.id + 1000 + index,
          tipo: 'stock',
          titulo: `Dispositivo sin nombre: ${item.productoNombre}`,
          tiempo: 'Hace 2 horas'
        });
      });
    
    // Si no hay alertas
    if (activities.length === 0) {
      activities.push({
        id: 9999,
        tipo: 'otro',
        titulo: 'Todo está en buen estado',
        tiempo: 'Ahora'
      });
    }
    
    return activities;
  } catch (error) {
    console.error("Error obteniendo actividad:", error);
    return [];
  }
}