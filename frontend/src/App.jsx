import React, { useEffect, useState } from 'react';

function App() {
  const [data, setData] = useState(null);

  useEffect(() => {
    // Se hace la llamada al backend en el puerto 8080 (mapeado al host)
    fetch('http://localhost:8080/api/test')
      .then((response) => response.json())
      .then((data) => setData(data))
      .catch((err) => console.error('Error:', err));
  }, []);

  return (
    <div>
      <h1>Proyecto Frontend</h1>
      {data ? <p>{data.message}</p> : <p>Cargando...</p>}
    </div>
  );
}

export default App;
