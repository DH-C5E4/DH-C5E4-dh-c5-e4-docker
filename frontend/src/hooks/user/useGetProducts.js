import axios from 'axios'
import { useEffect, useState } from 'react'

export function useGetProducts () {
  const [products, setProducts] = useState([])

  useEffect(() => {
    async function getProducts () {
      const url = `${import.meta.env.VITE_API_URL}/products`

      try {
        const { data } = await axios.get(url)
        setProducts(data)
      } catch (error) {
        console.log(error)
      }
    }

    getProducts()
  }, [])

  return { products }
}
