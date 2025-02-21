import { Warning } from '@mui/icons-material'
import { Card, CardContent, Typography } from '@mui/material'

const Mobile = () => {
  return (
    <div className='h-screen flex items-center justify-center bg-tertiary-50 text-center mx-auto'>
      <Card className='max-w-md p-4 bg-secondary-100'>
        <CardContent className='flex flex-col items-center'>
          <Warning className='text-primary-500 text-6xl mb-4' />
          <Typography
            variant='h5'
            className='font-bold text-primary-700 mb-2'
          >
            Panel no disponible
          </Typography>
          <Typography
            variant='body1'
            className='text-gray-700'
          >
            El panel de administración no está disponible en dispositivos móviles. Por favor, accede desde un
            dispositivo de escritorio.
          </Typography>
        </CardContent>
      </Card>
    </div>
  )
}

export default Mobile
