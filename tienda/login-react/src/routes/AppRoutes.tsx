import { Routes, Route, Navigate } from "react-router-dom";
import LoginForm from "../pages/LoginForm";
import Stocks from "../pages/Stocks";
import PerfilUsuario from "../pages/PerfilUsuario";
import HomePage from "../pages/HomePage";

export default function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<Navigate to="/login" replace />} />
      <Route path="/login" element={<LoginForm />} />
      <Route path="/HomePage" element={<HomePage />} /> 
      <Route path="/Stocks" element={<Stocks />} />
      <Route path="/PerfilUsuario" element={<PerfilUsuario />} />
      <Route path="*" element={<Navigate to="/login" replace />} />
    </Routes>
  );
}
