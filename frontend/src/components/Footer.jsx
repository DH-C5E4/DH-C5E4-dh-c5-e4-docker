import FacebookIcon from '@mui/icons-material/Facebook'
import InstagramIcon from '@mui/icons-material/Instagram'
import YouTubeIcon from '@mui/icons-material/YouTube'

const Footer = () => {
  return (
    <footer className='bg-gradient-to-b from-secondary-300 via-secondary-200 to-secondary-50 h-40'>
      <div className='max-w-[1200px] mx-auto h-full px-4'>
        {/* Desktop */}
        <div className='hidden sm:flex justify-between items-center h-full'>
          {/* Sección izquierda: Logo y título */}
          <div className='flex items-center space-x-4'>
            <img
              src='/logo.webp'
              alt='Maison de Porcelaine'
              className='w-20 h-20'
            />
            <h1 className='text-xl font-bold font-playfair'>
              <span className='block text-black'>MAISON DE</span>
              <span className='block text-secondary-300'>PORCELAINE</span>
            </h1>
          </div>

          {/* Sección derecha: Redes sociales y derechos reservados */}
          <div className='flex flex-col items-end'>
            <div className='flex flex-col items-end'>
              <div className='flex space-x-4 mb-2'>
                <a
                  href='#'
                  className='text-black text-2xl'
                >
                  <InstagramIcon fontSize='inherit' />
                </a>
                <a
                  href='#'
                  className='text-black text-2xl'
                >
                  <FacebookIcon fontSize='inherit' />
                </a>
                <a
                  href='#'
                  className='text-black text-3xl'
                >
                  <YouTubeIcon fontSize='inherit' />
                </a>
              </div>
              <div className='text-sm text-black'>© Grupo 4. Todos los derechos reservados.</div>
            </div>
          </div>
        </div>

        {/* Mobile */}
        <div className='flex flex-col items-center space-y-3 sm:hidden py-1.5'>
          {/* Redes sociales */}
          <div className='flex space-x-3'>
            <a
              href='#'
              className='text-black text-3xl'
            >
              <InstagramIcon fontSize='inherit' />
            </a>
            <a
              href='#'
              className='text-black text-3xl'
            >
              <FacebookIcon fontSize='inherit' />
            </a>
            <a
              href='#'
              className='text-black text-3xl'
            >
              <YouTubeIcon fontSize='inherit' />
            </a>
          </div>

          {/* Logo y título en una fila */}
          <div className='flex items-center space-x-2'>
            <img
              src='/logo.webp'
              alt='Maison de Porcelaine'
              className='w-16 h-16'
            />
            <h1 className='text-lg font-bold text-center font-playfair'>
              <span className='block text-black'>MAISON DE</span>
              <span className='block text-secondary-300'>PORCELAINE</span>
            </h1>
          </div>

          {/* Derechos reservados */}
          <div className='text-xs text-black text-center'>© Grupo 4. Todos los derechos reservados.</div>
        </div>
      </div>
    </footer>
  )
}

export default Footer
