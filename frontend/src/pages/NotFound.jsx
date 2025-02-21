import LayoutUser from '@/layouts/user/LayoutUser'
import { Home } from '@mui/icons-material'
import { Link } from 'react-router-dom'

const NotFound = () => {
  return (
    <LayoutUser>
      <div className='min-h-96 my-28 flex flex-col items-center justify-center p-4'>
        <div className='text-center space-y-6 max-w-lg'>
          <h1 className='text-9xl font-bold text-gray-800'>404</h1>

          <div className='space-y-2'>
            <h2 className='text-3xl font-semibold text-gray-700'>Página no encontrada</h2>
            <p className='text-gray-500'>Lo sentimos, la página que estás buscando no existe o ha sido movida.</p>
          </div>

          <Link
            to='/'
            className='inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg transition-colors duration-200'
          >
            <Home size={20} />
            Volver al inicio
          </Link>

          <p className='text-sm text-gray-400 mt-8'>
            Si crees que esto es un error, por favor contacta con soporte técnico.
          </p>
        </div>
      </div>
    </LayoutUser>
  )
}

export default NotFound
