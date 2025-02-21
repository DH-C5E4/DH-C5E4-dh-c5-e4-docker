import initialCategories from '@/mocks/user/categories'
import { Box } from '@mui/material'
import CategoryCard from './CategoryCard'

const CategorySection = () => {
  const categories = initialCategories.map((category, i) => {
    if (i === 0) {
      return {
        ...category,
        rowSpan: 2
      }
    }
    if (i === 5) {
      return {
        ...category,
        colSpan: 2
      }
    }
    return category
  })

  return (
    <Box
      component='section'
      className='flex flex-col gap-4'
    >
      <h4 className='col-span-2 text-center md:col-span-4 text-2xl'>Categorías</h4>
      <div className='grid auto-cols-fr auto-rows-fr grid-cols-2 gap-3 md:grid-cols-4 lg:gap-4'>
        {categories.map(category => (
          <CategoryCard
            key={category?.id}
            {...category}
          />
        ))}
      </div>
    </Box>
  )
}

export default CategorySection
