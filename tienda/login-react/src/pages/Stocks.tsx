import { useState, useEffect } from "react";
import "../styles/Stocks.css";
import NavBar from "../components/NavBar";
import {
  getAllStock,
  createStock,
  updateStock,
  deleteStock,
} from "../services/stockService";

type Dispositivo = {
  id: number;
  productoNombre: string;
  cantidad: number;
};

export default function Stocks() {
  const [dispositivos, setDispositivos] = useState<Dispositivo[]>([]);
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState<Dispositivo | null>(null);
  const [form, setForm] = useState({ productoNombre: "", cantidad: 0 });

  const loadData = async () => {
    const data = await getAllStock();
    setDispositivos(data);
  };

  useEffect(() => {
    // eslint-disable-next-line react-hooks/set-state-in-effect
    loadData();
  }, []);

  const openModal = (item?: Dispositivo | null) => {
    if (item) {
      setEditing(item);
      setForm({
        productoNombre: item.productoNombre,
        cantidad: item.cantidad,
      });
    } else {
      setEditing(null);
      setForm({ productoNombre: "", cantidad: 0 });
    }
    setModalOpen(true);
  };

  const save = async () => {
    if (editing) {
      await updateStock(editing.id, form);
    } else {
      await createStock(form);
    }
    setModalOpen(false);
    loadData();
  };

  const remove = async (id: number) => {
    if (confirm("¿Seguro que quieres borrar este dispositivo?")) {
      await deleteStock(id);
      loadData();
    }
  };

  return (
    <>
    <title> Stocks </title>
      <NavBar />
      <div className="stocks-background">
        <div className="stocks-container">
          <h1 className="stocks-title">Gestión de Dispositivos</h1>

          <button className="add-button" onClick={() => openModal()}>
             Agregar Dispositivo +
          </button>

          <table className="stocks-table">
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {dispositivos.map((d) => (
                <tr
                  key={d.id}
                  className={d.cantidad <= 2 ? "low-stock-row" : ""}
                >
                  <td>{d.productoNombre}</td>
                  <td>{d.cantidad}</td>
                  <td className="action-buttons">
                    <button className="edit-btn" onClick={() => openModal(d)}>
                      Editar
                    </button>
                    <button className="delete-btn" onClick={() => remove(d.id)}>
                      Eliminar
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>

          {modalOpen && (
            <div className="modal">
              <div className="modal-content">
                <h2>{editing ? "Editar Dispositivo" : "Nuevo Dispositivo"}</h2>

                <input
                  type="text"
                  placeholder="Nombre del dispositivo"
                  value={form.productoNombre}
                  onChange={(e) =>
                    setForm({ ...form, productoNombre: e.target.value })
                  }
                />

                <input
                  type="number"
                  placeholder="Cantidad"
                  value={form.cantidad}
                  onChange={(e) =>
                    setForm({ ...form, cantidad: Number(e.target.value) })
                  }
                />

                <button className="save-btn" onClick={save}>
                  Guardar
                </button>
              </div>
            </div>
          )}
        </div>
      </div>
    </>
  );
}
