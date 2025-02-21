import { Image } from '@mui/icons-material'
import Backdrop from '@mui/material/Backdrop'
import Fade from '@mui/material/Fade'
import Modal from '@mui/material/Modal'
import { useState } from 'react'
import Mobile from './Mobile'

const Desktop = ({ images, name }) => {
  const [open, setOpen] = useState(false)
  const handleOpen = () => setOpen(true)
  const handleClose = () => setOpen(false)

  return (
    <main className='grid grid-cols-2 gap-4 max-w-[1200px] mx-auto px-5 relative'>
      <div>
        <img
          src={images[0]}
          alt={name}
          className='rounded-xl object-cover'
        />
      </div>
      <div className='grid grid-cols-2 grid-rows-2 gap-4'>
        {images.slice(1).map((image, i) => (
          <img
            className='w-96 object-cover rounded-xl'
            key={i}
            src={image}
            alt={name}
          />
        ))}
      </div>

      <button
        onClick={handleOpen}
        className='flex items-center justify-center gap-2 w-fit py-2 px-4 bg-quaternary-100 rounded-lg absolute bottom-10 right-10 cursor-pointer hover:bg-quaternary-200 transition-colors duration-300'
      >
        <Image /> Mostrar más
      </button>

      <div>
        <Modal
          aria-labelledby='transition-modal-title'
          aria-describedby='transition-modal-description'
          open={open}
          onClose={handleClose}
          closeAfterTransition
          slots={{ backdrop: Backdrop }}
          slotProps={{
            backdrop: {
              timeout: 500
            }
          }}
        >
          <Fade in={open}>
            <div className='w-dvw lg:w-dvh my-10 mx-auto'>
              <Mobile
                images={images}
                name={name}
              />
            </div>
          </Fade>
        </Modal>
      </div>
    </main>
  )
}

export default Desktop
