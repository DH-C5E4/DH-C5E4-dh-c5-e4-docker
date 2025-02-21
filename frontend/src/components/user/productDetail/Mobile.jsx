import { useState } from 'react'
import Carousel from '../Carousel'

const Mobile = ({ images, name }) => {
  const [activeImage, setActiveImage] = useState(1)

  function handleActiveImage (index) {
    setActiveImage(index + 1)
  }

  return (
    <div className='relative'>
      <Carousel config={{ afterChange: handleActiveImage, dots: false }}>
        {images.map((image, index) => (
          <div
            key={index}
            className='relative'
          >
            <img
              className='w-full aspect-4/3 object-cover'
              src={image}
              alt={name}
            />
          </div>
        ))}
      </Carousel>
      <span className='absolute bottom-4 right-4 rounded-md bg-black/60 text-sm text-white py-1 px-3 font-bold'>
        {activeImage}/{images.length}
      </span>
    </div>
  )
}

export default Mobile
