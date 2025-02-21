import AdminPanel from './AdminPanel'

const Desktop = ({ children }) => {
  return (
    <>
      <AdminPanel />
      <section className='flex-1 px-8 py-10'>{children}</section>
    </>
  )
}

export default Desktop
