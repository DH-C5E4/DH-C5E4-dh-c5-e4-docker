import { useGetProducts } from '@/hooks/user/useGetProducts'
import { Box } from '@mui/material'
import { useEffect, useState } from 'react'
import Desktop from './Desktop'
import Mobile from './Mobile'

const RecommendationSection = () => {
  const [randomProducts, setRandomProducts] = useState([])
  const [innerWidth, setInnerWidth] = useState(window.innerWidth)

  const { products } = useGetProducts()

  useEffect(() => {
    function generateRandomProducts () {
      const shuffledProducts = [...products].sort(() => 0.5 - Math.random())
      return shuffledProducts.slice(0, 9)
    }

    setRandomProducts(generateRandomProducts())

    const handleResize = () => {
      setInnerWidth(window.innerWidth)
    }

    window.addEventListener('resize', handleResize)
    return () => {
      window.removeEventListener('resize', handleResize)
    }
  }, [products])

  return (
    <Box
      component='section'
      className='flex flex-col gap-4'
    >
      <h4 className='col-span-2 text-left md:col-span-4 text-xl'>Las vajillas más seleccionadas</h4>
      {innerWidth < 768 && <Mobile products={randomProducts} />}
      {innerWidth > 768 && <Desktop products={randomProducts} />}
    </Box>
  )
}

export default RecommendationSection
