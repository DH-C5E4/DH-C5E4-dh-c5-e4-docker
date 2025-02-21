import { useGetCategories } from '@/hooks/user/useGetCategories'
import { uploadImage } from '@/services/admin/uploadImage'
import { InputLabel, MenuItem, Select, TextField } from '@mui/material'
import { useEffect, useState } from 'react'
import { toast } from 'sonner'
import UploadImages from './UploadImages'

const UPLOAD_STATES = {
  idle: 'idle',
  uploading: 'uploading',
  uploaded: 'uploaded'
}

const INITIAL_PRODUCT_FORM_DATA = {
  name: '',
  description: '',
  mainImage: '',
  images: [],
  category: 0
}

const AddProductSection = () => {
  const [files, setFiles] = useState([])
  const [uploadedFiles, setUploadedFiles] = useState([])
  const [uploadState, setUploadState] = useState(UPLOAD_STATES.idle)
  const [productFormData, setProductFormData] = useState(INITIAL_PRODUCT_FORM_DATA)
  const [productData, setProductData] = useState({})

  const { categories } = useGetCategories()

  function resetForm () {
    setProductFormData(INITIAL_PRODUCT_FORM_DATA)
    setFiles([])
    setUploadedFiles([])
    setUploadState(UPLOAD_STATES.idle)
  }

  function handleChange (e) {
    setProductFormData({ ...productFormData, [e.target.name]: e.target.value })
  }

  function handleUploadImages (e) {
    const newFiles = Array.from(e.target.files)
    const uniqueFiles = newFiles.filter(newFile => !files.some(existingFile => existingFile.name === newFile.name))
    setFiles([...files, ...uniqueFiles])
    setProductFormData({ ...productFormData, images: [...files, ...uniqueFiles] })

    e.target.value = ''
  }

  function handleDeleteImage (fileName) {
    setFiles(files.filter(existingFile => existingFile.name !== fileName))
  }

  function validateForm () {
    return !productFormData.name
      ? toast.error('Debes completar el nombre del producto')
      : !productFormData.description
          ? toast.error('Debes completar la descripción del producto')
          : !productFormData.category
              ? toast.error('Debes seleccionar una categoría')
              : !productFormData.mainImage
                  ? toast.error('Debes seleccionar una imagen principal')
                  : !productFormData.images || files.length < 5
                      ? toast.error('Debes subir al menos 5 imágenes')
                      : true
  }

  function handleSubmit (e) {
    e.preventDefault()

    if (validateForm() !== true) return

    setUploadState(UPLOAD_STATES.uploading)
    setProductData({
      name: productFormData.name,
      description: productFormData.description,
      category: productFormData.category,
      images: [],
      mainImage: ''
    })

    const uploadPromises = files.map(file =>
      uploadImage(file).then(url => {
        setProductData(prev => {
          return file.name === productFormData.mainImage
            ? { ...prev, mainImage: url }
            : { ...prev, images: [...prev.images, url] }
        })
        setUploadedFiles(prev => [...prev, url])
      })
    )

    Promise.all(uploadPromises).then(() => {
      setUploadState(UPLOAD_STATES.uploaded)
    })
  }

  useEffect(() => {
    if (uploadState === UPLOAD_STATES.uploaded) {
      console.log('HACER EL POST AL BACKEND', console.log({ productData }))
    }

    if (uploadedFiles.length === files.length && uploadState === UPLOAD_STATES.uploaded) {
      resetForm()
    }
  }, [uploadState, uploadedFiles])

  return (
    <form
      className='flex flex-col gap-4 p-4 h-full bg-quaternary-200 rounded-md shadow-md max-w-3xl mx-auto overflow-y-scroll scroll-smooth'
      onSubmit={handleSubmit}
    >
      <fieldset className='mb-3 flex flex-col rounded-md border-2 px-3 py-4 shadow-sm shadow-slate-200 backdrop-blur-sm'>
        <legend className='px-1 text-lg font-bold'>
          <h3 className='text-center text-xl font-bold'>Datos del Producto</h3>
        </legend>
        <div>
          <div className='flex flex-nowrap items-end gap-4 mb-3'>
            <TextField
              id='name'
              name='name'
              variant='standard'
              value={productFormData.name}
              label='Nombre del Producto'
              className='w-full'
              onChange={handleChange}
              required
            />
            <div className='w-full overflow-hidden'>
              <InputLabel htmlFor='category'>Categorías</InputLabel>
              <Select
                id='category'
                name='category'
                variant='standard'
                value={productFormData.category}
                onChange={handleChange}
                className='w-full overflow-hidden'
                required
              >
                <MenuItem
                  value='0'
                  selected
                  disabled
                >
                  Selecciona una categoría
                </MenuItem>
                {categories.map(category => (
                  <MenuItem
                    key={category?.id}
                    value={category?.id}
                  >
                    {category?.description}
                  </MenuItem>
                ))}
              </Select>
            </div>
          </div>
          <div className='mb-3'>
            <div className='w-full flex flex-nowrap gap-4 mb-3'>
              <TextField
                id='stock'
                name='stock'
                variant='standard'
                value={productFormData?.stock}
                label='Stock del Producto'
                className='w-full'
                onChange={handleChange}
              />
              <TextField
                id='price'
                name='price'
                variant='standard'
                value={productFormData?.price}
                label='Precio del Producto'
                className='w-full'
                onChange={handleChange}
              />
            </div>
            <TextField
              id='description'
              name='description'
              variant='standard'
              value={productFormData?.description}
              label='Descripción del Producto'
              className='w-full'
              multiline
              onChange={handleChange}
              required
            />
          </div>
        </div>
      </fieldset>

      <UploadImages
        files={files}
        handleUploadImages={handleUploadImages}
        handleDeleteImage={handleDeleteImage}
        handleChange={handleChange}
      />

      <button
        type='submit'
        disabled={uploadState === UPLOAD_STATES.uploading}
        className='bg-secondary-300 cursor-pointer px-4 py-2 w-fit rounded-lg text-white hover:bg-secondary-600 transition-colors duration-300 font-bold text-xl disabled:cursor-not-allowed mx-auto'
      >
        Agregar Producto
      </button>
    </form>
  )
}

export default AddProductSection
