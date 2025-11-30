
export interface LoginRequest {
    username: string;
    password: string;
}

export interface LoginResponse {
    token: string;
    rol?: string; 
}

export async function login({ username, password }: { username: string; password: string }) {
  const response = await fetch("http://localhost:8080/auth/login", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ username, password }),
  });

  if (!response.ok) {
    let errMessage = "Error al iniciar sesión";
    try {
      const err = await response.json();
      errMessage = err.message || errMessage;
    } catch {
      // dejo un mensaje generico lol 
    }
    throw new Error(errMessage);
  }

  return response.json();
}


