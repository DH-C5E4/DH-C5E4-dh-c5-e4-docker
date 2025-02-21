import { Search } from '@mui/icons-material'

const SearchInput = ({ search, handleChangeSearch }) => {
  return (
    <div className='w-full flex h-10 flex-nowrap gap-6 items-center justify-between'>
      <label
        htmlFor='search'
        hidden
      >
        Buscar
      </label>
      <input
        type='text'
        name='search'
        id='search'
        value={search}
        placeholder='Buscar por nombre de producto'
        className='w-full p-2 border-b-[1px] border-transparent outline-none focus:border-secondary-500 transition-colors duration-500'
        onChange={handleChangeSearch}
      />
      <button
        type='submit'
        className='bg-secondary-600 h-fit w-fit p-2 rounded-full text-white font-bold'
      >
        <Search />
      </button>
    </div>
  )
}

export default SearchInput
