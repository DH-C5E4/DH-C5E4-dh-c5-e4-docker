import { lazy } from 'react'
import { Route, BrowserRouter as Router, Routes } from 'react-router-dom'

const HomeUser = lazy(() => import('@/pages/user/HomeUser'))
const HomeAdmin = lazy(() => import('@/pages/admin/HomeAdmin'))
const NotFound = lazy(() => import('@/pages/NotFound'))
const ProductDetail = lazy(() => import('@/pages/user/ProductDetail'))
const ProductsList = lazy(() => import('@/pages/admin/ProductsList'))
const AdminProfile = lazy(() => import('@/pages/admin/AdminProfile'))

const App = () => {
  return (
    <Router>
      <Routes>
        <Route
          index
          element={<HomeUser />}
        />

        <Route
          path='product/:id'
          element={<ProductDetail />}
        />

        <Route path='admin'>
          <Route
            index
            element={<HomeAdmin />}
          />
          <Route
            path='products'
            element={<ProductsList />}
          />
          <Route
            path='profile'
            element={<AdminProfile />}
          />
        </Route>

        <Route
          path='*'
          element={<NotFound />}
        />
      </Routes>
    </Router>
  )
}

export default App
