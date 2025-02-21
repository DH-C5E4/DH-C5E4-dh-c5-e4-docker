import axios from 'axios'

export async function uploadImage (file) {
  const url = `https://api.cloudinary.com/v1_1/${import.meta.env.VITE_CLOUDINARY_CLOUD_NAME}/image/upload/`

  try {
    const formData = new FormData()
    formData.append('file', file)
    formData.append('upload_preset', import.meta.env.VITE_CLOUDINARY_UPLOAD_PRESET)

    const { data } = await axios.post(url, formData)
    return data.url
  } catch (error) {
    console.error(error)
  }
}
