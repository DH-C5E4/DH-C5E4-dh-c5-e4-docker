import { ArrowBack } from '@mui/icons-material'
import { Divider } from '@mui/material'
import { DatePicker, LocalizationProvider } from '@mui/x-date-pickers'
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import dayjs from 'dayjs'
import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import Desktop from './Desktop'
import Mobile from './Mobile'

const ProductDetailSection = ({ name, description, mainImage, images, category, price }) => {
  const [innerWidth, setInnerWidth] = useState(window.innerWidth)

  useEffect(() => {
    const handleResize = () => {
      setInnerWidth(window.innerWidth)
    }

    window.scrollTo(0, 0)

    window.addEventListener('resize', handleResize)
    return () => {
      window.removeEventListener('resize', handleResize)
    }
  }, [])

  return (
    <article className='flex flex-col gap-4 overflow-hidden'>
      <header className='flex flex-col'>
        <div className='flex justify-between items-center px-6 py-2 lg:w-[1200px] lg:m-auto lg:py-4'>
          <h4 className='text-3xl font-bold text-primary-400'>{name}</h4>
          <Link to='/'>
            <ArrowBack /> Volver
          </Link>
        </div>
        <div>
          {innerWidth < 768 && (
            <Mobile
              images={[mainImage, ...images]}
              name={name}
            />
          )}
          {innerWidth > 768 && (
            <Desktop
              images={[mainImage, ...images]}
              name={name}
            />
          )}
        </div>
      </header>
      <main className='flex flex-col gap-8 px-5 py-8 md:flex-row-reverse max-w-[1200px] m-auto'>
        <section className='flex flex-col gap-4 items-center border-2 border-quaternary-400 rounded-lg p-4 md:min-w-[360px] h-fit'>
          <p className='self-start font-bold text-2xl'>${price} c/u</p>
          <form className='flex flex-col gap-4 w-full items-center'>
            <div className='flex flex-nowrap gap-4 w-full'>
              <PickDate label='Desde' />
              <PickDate label='Hasta' />
            </div>
            <div className='flex flex-col gap-1 w-full'>
              <label>Cantidad:</label>
              <input
                type='number'
                min={1}
                max={100}
                defaultValue={1}
                className='w-full p-4 border-[1px] border-quaternary-400 rounded-sm text-xl'
              />
            </div>
            <button className='bg-primary-300 cursor-pointer px-4 py-2 w-fit rounded-lg text-white hover:bg-primary-600 transition-colors duration-300 font-bold text-xl'>
              Reservar
            </button>
          </form>
        </section>
        <section className='flex flex-col gap-4'>
          <Detail
            title='Categoría'
            description={category?.description}
          />
          <Divider />
          <Detail
            title='Descripción'
            description={description}
          />
        </section>
      </main>
    </article>
  )
}

export default ProductDetailSection

const Detail = ({ title, description }) => {
  return (
    <div>
      <h5 className='text-2xl font-bold mb-1'>{title}</h5>
      <p className='text-xl text-quaternary-800 text-pretty'>{description}</p>
    </div>
  )
}

const PickDate = ({ label, handleChange }) => {
  return (
    <div className='flex flex-col gap-1 w-full'>
      <label>{label}:</label>
      <LocalizationProvider dateAdapter={AdapterDayjs}>
        <DatePicker
          defaultValue={dayjs()}
          onChange={handleChange}
        />
      </LocalizationProvider>
    </div>
  )
}
