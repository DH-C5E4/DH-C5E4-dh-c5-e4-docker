import LoginIcon from '@mui/icons-material/Login'
import MenuIcon from '@mui/icons-material/Menu'
import PersonAddIcon from '@mui/icons-material/PersonAdd'
import { Drawer, IconButton, List, ListItemButton, ListItemIcon, ListItemText } from '@mui/material'
import { useState } from 'react'
import { NavLink } from 'react-router-dom'

const Header = () => {
  const [drawerOpen, setDrawerOpen] = useState(false)

  const toggleDrawer = open => event => {
    if (event.type === 'keydown' && (event.key === 'Tab' || event.key === 'Shift')) {
      return
    }
    setDrawerOpen(open)
  }

  return (
    <header className='sticky top-0 w-full h-35 sm:h-40 flex shadow-md z-50 bg-white/80 backdrop-blur-md'>
      <div className='w-[1200px] flex mx-auto justify-between z-10'>
        {/* Sección izquierda: Logo y título */}
        <div className='flex flex-col sm:flex-row justify-start items-center p-4 w-1/2'>
          <img
            src='/logo.webp'
            alt='Maison de Porcelaine'
            className='w-16 h-16 sm:w-30 sm:h-30 sm:mr-4'
          />
          <h1 className='text-xl sm:text-3xl font-bold leading-tight text-center sm:text-left font-playfair'>
            <span className='block text-black'>MAISON DE </span>
            <span className='block text-secondary-300'>PORCELAINE</span>
          </h1>
        </div>

        {/* Sección derecha:links y gradiente */}
        <div className='flex sm:items-start justify-end p-6 w-full'>
          {/* Desktop navigation */}
          <nav className='hidden sm:flex space-x-6 items-center'>
            <NavLink
              to='/login'
              className='font-bold text-black hover:text-gray-700 transition-all duration-200 transform hover:-translate-y-1'
            >
              <LoginIcon className='text-secondary-500 m-1.5' />
              Iniciar Sesión
            </NavLink>
            <NavLink
              to='/register'
              className='font-bold text-primary-700 hover:text-primary-500 transition-all duration-200 transform hover:-translate-y-1'
            >
              <PersonAddIcon className='text-primary-700 m-1.5' />
              Crear Cuenta
            </NavLink>
          </nav>

          {/* Mobile: Menu icon */}
          <div className='sm:hidden'>
            <IconButton
              aria-label='menu'
              onClick={toggleDrawer(true)}
              className='text-black text-4xl'
            >
              <MenuIcon fontSize='inherit' />
            </IconButton>
            <Drawer
              anchor='top'
              open={drawerOpen}
              onClose={toggleDrawer(false)}
              classes={{ paper: 'h-1/2 w-full bg-secondary-100' }}
            >
              {/* Contenido del Drawer */}
              <div className='flex flex-col items-center p-6'>
                {/* Logo y título en el menú */}
                <div className='flex items-center space-x-3 mb-4'>
                  <img
                    src='/logo.webp'
                    alt='Maison de Porcelaine'
                    className='w-18 h-18'
                  />
                  <h1 className='text-2xl font-bold font-playfair text-center'>
                    <span className='block text-black'>MAISON DE</span>
                    <span className='block text-secondary-300'>PORCELAINE</span>
                  </h1>
                </div>
                {/* Opciones del menú con hover y mejor interacción */}
                <List className='w-full'>
                  <NavLink
                    to='/login'
                    className='block w-full hover:bg-secondary-200 transition-all duration-200 rounded-lg'
                  >
                    <ListItemButton>
                      <ListItemIcon>
                        <LoginIcon className='text-secondary-500' />
                      </ListItemIcon>
                      <ListItemText
                        primary='Iniciar Sesión'
                        className='text-black font-bold text-lg'
                      />
                    </ListItemButton>
                  </NavLink>

                  <NavLink
                    to='/register'
                    className='block w-full hover:bg-primary-200 transition-all duration-200 rounded-lg'
                  >
                    <ListItemButton>
                      <ListItemIcon>
                        <PersonAddIcon className='text-primary-700' />
                      </ListItemIcon>
                      <ListItemText
                        primary='Crear Cuenta'
                        className='text-black font-bold text-lg'
                      />
                    </ListItemButton>
                  </NavLink>
                </List>
              </div>
            </Drawer>
          </div>
        </div>
      </div>
    </header>
  )
}

export default Header
