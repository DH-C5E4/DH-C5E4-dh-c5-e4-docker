import { Box, Divider } from '@mui/material'
import { useState } from 'react'
import SearchCategory from './SearchCategory'
import SearchInput from './SearchInput'

const SearchSection = () => {
  const [category, setCategory] = useState('0')
  const [search, setSearch] = useState('')

  function handleChangeCategory (event) {
    setCategory(event.target.value)
  }

  function handleChangeSearch (event) {
    setSearch(event.target.value)
  }

  function handleSubmit (event) {
    event.preventDefault()
    console.log('Submit')
  }

  return (
    <Box
      component='section'
      className='flex flex-col gap-4 p-4 rounded-2xl border-2 border-quaternary-300 lg:w-[720px] m-auto'
    >
      <form
        className='flex flex-col gap-3 lg:flex-row lg:gap-8 '
        onSubmit={handleSubmit}
      >
        <SearchCategory
          category={category}
          handleChangeCategory={handleChangeCategory}
        />
        <Divider />
        <SearchInput
          search={search}
          handleChangeSearch={handleChangeSearch}
        />
      </form>
    </Box>
  )
}

export default SearchSection
