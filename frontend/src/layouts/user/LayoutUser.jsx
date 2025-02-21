import Footer from '@/components/Footer'
import Header from '@/components/Header'

const LayoutUser = ({ children }) => {
  return (
    <>
      <Header />
      <main className='w-full p-0 m-0'>{children}</main>
      <Footer />
    </>
  )
}

export default LayoutUser
