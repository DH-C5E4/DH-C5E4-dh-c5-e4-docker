import ProductDetailSection from '@/components/user/productDetail/ProductDetailSection'
import { useGetProducts } from '@/hooks/user/useGetProducts'
import LayoutUser from '@/layouts/user/LayoutUser'
import { useParams } from 'react-router-dom'

const ProductDetail = () => {
  const id = parseInt(useParams()?.id)

  const { products } = useGetProducts()

  const product = products.find(product => product.id === parseInt(id))

  return (
    <LayoutUser>
      {product && <ProductDetailSection {...product} />}
      {!product && <p>Producto no encontrado</p>}
    </LayoutUser>
  )
}

export default ProductDetail
