import AddProductSection from '@/components/admin/addProduct/AddProductSection'
import { useGetProducts } from '@/hooks/user/useGetProducts'
import LayoutAdmin from '@/layouts/admin/LayoutAdmin'
import { AddCircle, Close, Delete, Edit } from '@mui/icons-material'
import axios from 'axios'
import { useState } from 'react'
import DataTable from 'react-data-table-component'
import { toast } from 'sonner'
import Swal from 'sweetalert2'

const ProductsList = () => {
  const [openAddProduct, setOpenAddProduct] = useState(false)

  const { products } = useGetProducts()

  const TABLE_COLUMNS = [
    {
      name: 'ID',
      selector: row => row.id,
      width: '50px'
    },
    {
      name: 'Nombre',
      selector: row => row.name,
      maxWidth: '200px',
      sortable: true
    },
    {
      name: 'Descripción',
      selector: row => row.description,
      maxWidth: '300px'
    },
    {
      name: 'Categoria',
      selector: row => row.category,
      maxWidth: '150px'
    },
    {
      name: 'Stock',
      selector: row => row.stock,
      maxWidth: '100px'
    },
    {
      name: 'Precio',
      selector: row => row.price,
      maxWidth: '100px'
    },
    {
      name: 'Acciones',
      cell: row => (
        <div className='flex gap-2'>
          <button
            type='button'
            className='flex items-center gap-1 text-white cursor-pointer bg-secondary-400 rounded-lg px-2 py-1 min-w-fit hover:bg-secondary-700 transition-colors duration-300'
            onClick={() => toast.success('Funcionalidad no implementada')}
          >
            <Edit />
          </button>
          <button
            type='button'
            className='flex items-center gap-1 text-white cursor-pointer bg-red-800 rounded-lg px-2 py-1 min-w-fit hover:bg-red-600 transition-colors duration-300'
            onClick={() => {
              Swal.fire({
                title: '¿Estás seguro de eliminar este producto?',
                text: 'Esta acción no se puede revertir',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
              }).then(result => {
                if (result.isConfirmed) {
                  // TODO: Implement delete product

                  const url = `${import.meta.env.VITE_API_URL}/products/${row.id}`
                  axios.delete(url).then(() => {
                    toast.success(`Producto ${row.id} eliminado`)
                  }).catch(() => {
                    toast.error(`Error eliminando producto ${row.id}`)
                  })
                }
              })
            }}
          >
            <Delete />
          </button>
        </div>
      )
    }
  ]

  const TABLE_DATA = products?.map(product => ({
    id: product?.id,
    name: product?.name,
    description: product?.description,
    category: product?.category?.description,
    stock: product?.stock,
    price: product?.price
  }))

  function handleToggleAddProduct () {
    setOpenAddProduct(prev => !prev)
  }

  return (
    <LayoutAdmin>
      <article className='flex flex-col gap-12'>
        <header className='flex flex-col gap-5'>
          <h2 className='font-bold text-2xl'>Productos</h2>
          <button
            type='button'
            className='flex items-center gap-2 px-4 py-2 rounded-lg cursor-pointer transition-colors duration-300 w-fit border-[1px] hover:bg-secondary-900 hover:text-white'
            onClick={handleToggleAddProduct}
          >
            <AddCircle /> Agregar Producto
          </button>
        </header>
        <main className='flex flex-col gap-4'>
          <div>Filter Buttons</div>
          <div>
            <DataTable
              columns={TABLE_COLUMNS}
              data={TABLE_DATA}
              selectableRows
              fixedHeader
              progressPending={!products}
              progressComponent={<h2>Cargando...</h2>}
              noDataComponent={<p>No se encontraron productos</p>}
              pagination
              paginationPerPage={10}
              paginationComponentOptions={{
                noRowsPerPage: true
              }}
            />
          </div>
        </main>
        <section
          className={`absolute ${
            !openAddProduct && 'hidden'
          } z-50 top-0 right-0 h-dvh w-lg justify-center items-center`}
        >
          <button
            type='button'
            className='absolute p-1 bg-black text-white z-50 rounded-full -left-4 top-2 cursor-pointer hover:scale-105 transition-all'
            onClick={handleToggleAddProduct}
          >
            <Close />
          </button>
          <AddProductSection />
        </section>
      </article>
    </LayoutAdmin>
  )
}

export default ProductsList
