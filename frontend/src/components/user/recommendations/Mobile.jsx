import 'slick-carousel/slick/slick-theme.css'
import 'slick-carousel/slick/slick.css'
import Carousel from '../Carousel'
import RecommendationCard from './RecommendationCard'

const Mobile = ({ products }) => {
  return (
    <Carousel>
      {products.map((product, index) => (
        <RecommendationCard key={index} {...product} />
      ))}
    </Carousel>
  )
}

export default Mobile
