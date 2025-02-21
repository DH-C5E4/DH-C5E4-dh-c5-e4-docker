const CategoryCard = ({ image, description, colSpan = false, rowSpan = false }) => {
  return (
    <div
      className={`relative group ${rowSpan ? 'row-span-2' : ''} ${
        colSpan ? 'aspect-2/1 col-span-2' : ''
      } rounded-2xl overflow-hidden after:bg-linear-to-t after:from-black/80 after:via-40% after:via-black/0 after:absolute after:inset-0 after:z-10 shadow-md hover:after:bg-black/10 after:transition-all duration-500 cursor-pointer`}
    >
      <img
        src={image}
        alt={description}
        className='w-full h-full object-cover group-hover:scale-105 transition-all duration-500'
      />
      <p className='absolute bottom-2 left-2 text-xl font-bold text-white z-40'>{description}</p>
    </div>
  )
}

export default CategoryCard
