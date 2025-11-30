import { Link } from "react-router-dom";
import "../styles/NavBar.css";
import { useEffect, useState } from "react";


export default function NavBar() {
    const [username, setUsername] = useState<string>("");
    
    useEffect(() => {
        // aca obtengo el username del localStorage
        const Usernameguardado = localStorage.getItem("username");
        console.log("Username desde el localStorage: ", Usernameguardado);
        if (Usernameguardado) {
            // eslint-disable-next-line react-hooks/set-state-in-effect
            setUsername(Usernameguardado);

        }
    }, []);
  return (
    <nav className="navbar">
      <div className="navbar-left">
        <Link to="/PerfilUsuario" className="brand">
        <div className="logo-container">
          <img src="/WorldofDesign.jpg" alt="usuario" className="logo" />
          {username && <span className="username-display">@{username}</span>}
          </div>
        </Link>
      </div>

      <ul className="navbar-links">
        <li><Link to="/HomePage">Dashboard</Link></li>
        <li><Link to="/Stocks">Dispositivos</Link></li>
        <li><Link to="/login">Cerrar Sesión</Link></li>
      </ul>
    </nav>
  );
}
