import { AccountCircle, Inventory } from '@mui/icons-material'
import { useEffect, useState } from 'react'
import { NavLink } from 'react-router-dom'

const NAV_LINKS = [
  {
    id: 1,
    description: 'Productos',
    icon: <Inventory fontSize='small' />,
    to: '/admin/products'
  }
]

const AdminPanel = () => {
  const [adminName, setAdminName] = useState('')

  useEffect(() => {
    const fetchAdminData = () => {
      const Admin = { name: 'Esteban Albán' } // Simulación de datos de admin TODO reemplazar por llamada a API
      setAdminName(Admin.name)
    }

    fetchAdminData()
  }, [])

  return (
    <div className='flex min-h-screen bg-quaternary-100'>
      {/* Menú lateral */}
      <aside className='w-64 bg-secondary-900 text-white flex flex-col justify-between p-6 rounded-r-2xl'>
        {/* Logo */}
        <div>
          <div className='flex items-center space-x-2 border-b border-white py-4'>
            <img
              src='/logo.webp'
              alt='Maison de Porcelaine'
              className='w-12 h-12'
            />
            <h2 className='text-xl font-bold font-playfair'>MAISON DE PORCELAINE</h2>
          </div>
          {/* Opciones de menú */}
          <nav className=' mt-4 space-y-2'>
            {
              NAV_LINKS.map(({ id, description, icon, to }) => (
                <NavLink
                  key={id}
                  to={to}
                  className={({ isActive }) =>
                    `flex items-center gap-3 py-2 px-4 rounded-lg ${
                      isActive ? 'bg-secondary-500' : 'hover:bg-secondary-400'
                    } transition-colors duration-300`
                  }
                >
                  {icon}
                  <span>{description}</span>
                </NavLink>
              ))
            }
          </nav>
        </div>
        {/* Usuario admin - Linkeado dinámicamente */}
        <div className='border-t border-white mt-8 pt-4'>
          <NavLink
            to='/admin/profile'
            className='flex items-center gap-3 text-white hover:text-gray-300'
          >
            <AccountCircle fontSize='small' />
            <span className='text-sm'>{adminName || 'Admin'}</span>
          </NavLink>
        </div>
      </aside>
    </div>
  )
}
export default AdminPanel
