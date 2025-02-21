import { Link } from 'react-router-dom'

const RecommendationCard = ({ id, name, mainImage, category, price }) => {
  return (
    <Link to={`/product/${id}`}>
      <article className='relative group flex flex-col rounded-2xl overflow-hidden bg-quaternary-50 border-[1px] border-quaternary-300 pb-2 after:absolute after:inset-0 after:z-10 after:bg-transparent hover:after:bg-quaternary-300/10 after:transition-all duration-500 cursor-pointer'>
        <header>
          <img
            src={mainImage}
            alt={name}
            className='w-full object-cover h-48 group-hover:scale-105 transition-all duration-500'
          />
        </header>
        <main className='flex flex-col gap-2 p-3'>
          <h5 className='text-xl font-bold text-primary-400'>{name}</h5>
          <p className='text-quaternary-600'>{category?.description}</p>
        </main>
      </article>
    </Link>
  )
}

export default RecommendationCard
