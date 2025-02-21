import axios from 'axios'
import { useEffect, useState } from 'react'

export function useGetCategories () {
  const [categories, setCategories] = useState([])

  useEffect(() => {
    async function getCategories () {
      const url = `${import.meta.env.VITE_API_URL}/categories`

      try {
        const { data } = await axios.get(url)
        setCategories(data)
      } catch (error) {
        console.log(error)
      }
    }

    getCategories()
  }, [])

  return { categories }
}
