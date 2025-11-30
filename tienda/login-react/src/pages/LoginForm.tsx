import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { login } from "../services/authService";
import "../styles/loginForm.css";


export default function LoginForm() {
  const navigate = useNavigate();
  const [username, setUsername] = useState(""); 
  const [password, setPassword] = useState("");
  const [error, setError] = useState(""); // guarda un mensaje si algo sale mal.
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    try {
      const data = await login({ username, password });
      localStorage.setItem("token", data.token);
      localStorage.setItem("username", username); // guarda ambos en localStorage.

      console.log("Token guardado: ", data.token)
      console.log("Username guardado: ", username);
      navigate("/HomePage"); 
    } catch (err: unknown) {
      if (err instanceof Error) setError(err.message);
      else setError("Error desconocido");
    } finally {
      setLoading(false);
    }
  };

  return (

    <><title> LOGIN </title>
    <div className="login-background">
      <div className="login-container">
        <h1>Fer's Market </h1>
        <form className="login-card" onSubmit={handleSubmit}>
          <h2 className="title">Iniciar Sesión</h2>

          <input
            type="text"
            placeholder="Usuario"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
            required />

          <input
            type="password"
            placeholder="Contraseña"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required />

          <button type="submit" disabled={loading}>
            {loading ? "Cargando..." : "Ingresar"}
          </button>

          {error && <p className="error">{error}</p>}
        </form>
      </div>
    </div></>
  );
}
