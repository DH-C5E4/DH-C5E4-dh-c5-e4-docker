import RecommendationCard from './RecommendationCard'

const Desktop = ({ products }) => {
  return (
    <div className='grid grid-cols-3 gap-4'>
      {products.map(product => (
        <RecommendationCard
          key={product.id}
          {...product}
        />
      ))}
    </div>
  )
}

export default Desktop
