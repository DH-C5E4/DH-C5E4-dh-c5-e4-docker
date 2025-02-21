import { useGetCategories } from '@/hooks/user/useGetCategories'
import { MenuItem, Select } from '@mui/material'

const SearchCategory = ({ category, handleChangeCategory }) => {
  const { categories } = useGetCategories()

  return (
    <div className='w-full h-10 flex flex-nowrap gap-6 items-center justify-between'>
      <label htmlFor='categories'>Categorías</label>
      <Select
        name='categories'
        id='categories'
        value={category}
        variant='standard'
        className='w-full overflow-hidden'
        onChange={handleChangeCategory}
      >
        <MenuItem
          value='0'
          selected
        >
          Todas
        </MenuItem>
        {categories.map(category => (
          <MenuItem
            key={category?.id}
            value={category?.id}
          >
            {category?.description}
          </MenuItem>
        ))}
      </Select>
    </div>
  )
}

export default SearchCategory
