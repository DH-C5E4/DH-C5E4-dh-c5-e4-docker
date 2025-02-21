import Desktop from '@/components/admin/adminPanel/Desktop'
import Mobile from '@/components/admin/adminPanel/Mobile'
import { useEffect, useState } from 'react'

const isMobile = window.navigator.userAgentData.mobile

const LayoutAdmin = ({ children }) => {
  const [innerWidth, setInnerWidth] = useState(window.innerWidth)

  useEffect(() => {
    function handleResize () {
      setInnerWidth(window.innerWidth)
    }

    window.addEventListener('resize', handleResize)

    return () => {
      window.removeEventListener('resize', handleResize)
    }
  }, [])

  return (
    <main className='flex w-full h-full overflow-hidden'>
      {(isMobile || innerWidth < 1024) && <Mobile />}
      {(!isMobile && innerWidth > 1024) && <Desktop>{children}</Desktop>}
    </main>
  )
}

export default LayoutAdmin
