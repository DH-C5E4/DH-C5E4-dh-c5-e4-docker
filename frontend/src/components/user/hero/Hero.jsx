const Hero = () => {
  return (
    <section className='relative w-full h-80 lg:h-[420px]'>
      <img
        src='https://res.cloudinary.com/duxlduuy2/image/upload/v1739754795/hero_qbunqg.webp'
        alt='Maison de Porcelaine'
        className='w-full h-full object-cover'
      />
      <h3 className='absolute bottom-10 font-bold text-center text-balance w-full text-3xl bg-black/60 py-4 text-white shadow-xl'>
        Lorem ipsum dolor sit amet consectetur.
      </h3>
    </section>
  )
}

export default Hero
