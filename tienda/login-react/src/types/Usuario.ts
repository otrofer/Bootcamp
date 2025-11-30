export interface StockDTO {
  id: number;
  nombre: string;
  cantidad: number;
}

export interface UsuarioDTO {
  id: number;
  nombre: string;
  email: string;
  stocks: StockDTO[];
}
