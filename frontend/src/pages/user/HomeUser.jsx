import CategorySection from '@/components/user/categories/CategorySection'
import Hero from '@/components/user/hero/Hero'
import RecommendationSection from '@/components/user/recommendations/RecommendationSection'
import SearchSection from '@/components/user/search/SearchSection'
import LayoutUser from '@/layouts/user/LayoutUser'
import { Container } from '@mui/material'

const HomeUser = () => {
  return (
    <LayoutUser>
      <Hero />
      <Container
        component='section'
        sx={{ padding: '20px 32px', display: 'flex', flexDirection: 'column', flexWrap: 'nowrap', gap: '36px' }}
      >
        <SearchSection />
        <CategorySection/>
        <RecommendationSection />
      </Container>
    </LayoutUser>
  )
}

export default HomeUser
