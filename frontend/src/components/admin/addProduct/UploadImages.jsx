import { Close, FileUpload } from '@mui/icons-material'

const UploadImages = ({ files, handleUploadImages, handleDeleteImage, products, handleChange }) => {
  return (
    <fieldset className='flex flex-col gap-4 mb-3 rounded-md border-2 px-3 py-4 shadow-sm shadow-slate-200 backdrop-blur-sm'>
      <legend className='px-1 text-lg'>Selecciona la imagen principal</legend>
      <div className={`flex flex-wrap gap-4 ${files.length === 0 && 'hidden'}`}>
        {files.map((file, index) => (
          <label
            key={index}
            htmlFor={file?.name}
            className='relative'
          >
            <img
              src={URL.createObjectURL(file)}
              alt='vajilla'
              className='w-32 h-32 object-cover rounded-md cursor-pointer -z-10'
            />
            <input
              id={file?.name}
              type='radio'
              name='mainImage'
              value={file?.name}
              onChange={handleChange}
              className='absolute top-2 left-2'
              required
            />
            <button
              type='button'
              className='rounded-full flex items-center justify-center absolute top-2 right-2 cursor-pointer text-white bg-red-700 hover:bg-red-800 transition-colors duration-300'
              onClick={() => handleDeleteImage(file?.name)}
            >
              <Close />
            </button>
          </label>
        ))}
      </div>
      <label
        htmlFor='uploadImages'
        className='bg-quaternary-100 w-fit px-4 py-2 cursor-pointer rounded-lg border-[1px] hover:bg-quaternary-300 transition-colors duration-300'
      >
        <FileUpload />
        Seleccionar Imágenes
        <input
          type='file'
          name='uploadImages'
          id='uploadImages'
          className='hidden'
          onChange={handleUploadImages}
          accept='image/png, image/jpeg'
          multiple
        />
      </label>
    </fieldset>
  )
}

export default UploadImages
