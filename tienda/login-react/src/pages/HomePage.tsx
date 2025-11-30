import { useState, useEffect } from "react";
import "../styles/HomePage.css";
import { Link } from "react-router-dom";
import NavBar from "../components/NavBar";
import { getDashboardStats, getRecentActivity } from "../services/homepageService";
import type { DashboardStats, Activity } from "../services/homepageService";

export default function HomePage() {
  const [stats, setStats] = useState<DashboardStats | null>(null);
  const [activities, setActivities] = useState<Activity[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const username = localStorage.getItem("username") || "Usuario";

  useEffect(() => {
    loadDashboardData();
  }, []);

  const loadDashboardData = async () => {
    try {
      setLoading(true);
      setError("");

      const [statsData, activityData] = await Promise.all([
        getDashboardStats(),
        getRecentActivity(),
      ]);

      setStats(statsData);
      setActivities(activityData);
    } catch (err) {
      console.error("Error cargando dashboard:", err);
      setError("Error al cargar los datos. Por favor, recargá la página.");
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <>
        <NavBar />
        <div className="dashboard-background">
          <div className="dashboard-container">
            <p className="status-message">Cargando dashboard...</p>
          </div>
        </div>
      </>
    );
  }

  if (error) {
    return (
      <>
        <NavBar />
        <div className="dashboard-background">
          <div className="dashboard-container">
            <p className="status-message error">{error}</p>
            <button onClick={loadDashboardData} className="retry-button">
              Reintentar
            </button>
          </div>
        </div>
      </>
    );
  }

  return (
    <>
    <title> Fer's Market </title>
      <NavBar />
      <div className="dashboard-background">
        <div className="dashboard-container">
          <div className="welcome-message">
            <h1>
              Bienvenido de nuevo, <span className="username-highlight">@{username}</span>
            </h1>
          </div>

          <div className="summary-cards">
            <div className="card total-devices">
              <h3>Total Dispositivos</h3>
              <p className="big-number">{stats?.totalProductos || 0}</p>
            </div>

            <div className="card total-users">
              <h3>Usuarios Totales</h3>
              <p className="big-number">{stats?.totalUsuarios || 0}</p>
            </div>
          </div>

          <div className="quick-access">
            <h2>Acceso Rápido</h2>
            <div className="access-buttons">
              <Link to="/Stocks" className="access-link">
                <div className="access-card">Gestionar Dispositivos</div>
              </Link>
              <Link to="/reportes" className="access-link">
                <div className="access-card">Ver Reportes</div>
              </Link>
            </div>
          </div>

          <div className="recent-activity">
            <h2>actividad reciente: </h2>
            {activities.length > 0 ? (
              <ul className="activity-list">
                {activities.map((act) => (
                  <li key={act.id} className="activity-item">
                    <span className="activity-title">{act.titulo}</span>{" "}
                  </li>
                ))}
              </ul>
            ) : (
              <p className="no-activity">No hay actividad reciente</p>
            )}
          </div>
        </div>
      </div>
    </>
  );
}
