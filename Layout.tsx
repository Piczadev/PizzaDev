import React from 'react';

interface LayoutProps {
  children: React.ReactNode; // Aquí definimos el tipo de children
}

const Layout: React.FC<LayoutProps> = ({ children }) => {
  return (
    <div style={{ maxWidth: '640px', margin: '0 auto', padding: '2rem' }}>
      <header><h1>ElPicza Blog</h1></header>
      {children} {/* Aquí se renderizan los hijos */}
    </div>
  );
}

export default Layout;
