export const getStocks = async (token: string) => {
  const res = await fetch("http://localhost:8080/api/stock", {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  });
  if (!res.ok) throw new Error("No autorizado");
  return res.json();
};
