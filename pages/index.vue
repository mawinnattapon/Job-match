<script setup lang="ts">
import { ref, onMounted } from 'vue'

// สถานะการค้นหา
const searchQuery = ref('')
const selectedCategory = ref('all')
const isLoading = ref(false)

// ข้อมูลหมวดหมู่งาน
const jobCategories = ref([
  { id: 'all', name: 'ทุกหมวดหมู่' },
  { id: 'tech', name: 'เทคโนโลยี' },
  { id: 'marketing', name: 'การตลาด' },
  { id: 'design', name: 'ดิไซน์' },
  { id: 'finance', name: 'การเงิน' },
  { id: 'hr', name: 'ทรัพยากรบุคคล' },
  { id: 'sales', name: 'ขาย' }
])

// ข้อมูลงานแนะนำ
const recommendedJobs = ref([
  {
    id: 1,
    title: 'Senior Frontend Developer',
    company: 'TechCorp Thailand',
    location: 'กรุงเทพฯ',
    salary: '80,000 - 120,000 บาท',
    type: 'Full-time',
    match: 95,
    tags: ['React', 'TypeScript', 'Vue.js'],
    logo: '/api/placeholder/40/40',
    isFavorite: false,
    matchScore: 95,
    posted: '2 วันที่แล้ว'
  },
  {
    id: 2,
    title: 'UX/UI Designer',
    company: 'Creative Studio',
    location: 'เชียงใหม่',
    salary: '45,000 - 65,000 บาท',
    type: 'Full-time',
    match: 88,
    tags: ['Figma', 'Adobe XD', 'Sketch'],
    logo: '/api/placeholder/40/40',
    isFavorite: true,
    matchScore: 88,
    posted: '1 วันที่แล้ว'
  },
  {
    id: 3,
    title: 'Digital Marketing Manager',
    company: 'Growth Agency',
    location: 'กรุงเทพฯ',
    salary: '60,000 - 90,000 บาท',
    type: 'Full-time',
    match: 82,
    tags: ['SEO', 'Google Ads', 'Social Media'],
    logo: '/api/placeholder/40/40',
    isFavorite: false,
    matchScore: 82,
    posted: '3 วันที่แล้ว'
  },
  {
    id: 4,
    title: 'Data Scientist',
    company: 'AI Solutions',
    location: 'กรุงเทพฯ',
    salary: '70,000 - 100,000 บาท',
    type: 'Full-time',
    match: 91,
    tags: ['Python', 'Machine Learning', 'SQL'],
    logo: '/api/placeholder/40/40',
    isFavorite: false,
    matchScore: 91,
    posted: '1 วันที่แล้ว'
  },
  {
    id: 5,
    title: 'Product Manager',
    company: 'Startup Hub',
    location: 'กรุงเทพฯ',
    salary: '85,000 - 130,000 บาท',
    type: 'Full-time',
    match: 87,
    tags: ['Product Strategy', 'Agile', 'Analytics'],
    logo: '/api/placeholder/40/40',
    isFavorite: true,
    matchScore: 87,
    posted: '4 วันที่แล้ว'
  },
  {
    id: 6,
    title: 'DevOps Engineer',
    company: 'Cloud Systems',
    location: 'กรุงเทพฯ',
    salary: '75,000 - 110,000 บาท',
    type: 'Full-time',
    match: 89,
    tags: ['AWS', 'Docker', 'Kubernetes'],
    logo: '/api/placeholder/40/40',
    isFavorite: false,
    matchScore: 89,
    posted: '2 วันที่แล้ว'
  }
])

// ข้อมูลบทความ
const careerArticles = ref([
  {
    id: 1,
    title: '10 เคล็ดลับการเตรียมตัวสัมภาษณ์งานให้ประสบความสำเร็จ',
    summary: 'เรียนรู้วิธีการเตรียมตัวสัมภาษณ์งานอย่างมืออาชีพ ตั้งแต่การวิจัยบริษัท การแต่งกาย ไปจนถึงการตอบคำถามยาก ๆ',
    category: 'สัมภาษณ์งาน',
    author: 'อาจารย์สมชาย',
    date: '15 ม.ค. 2024',
    readTime: 8,
    image: '/api/placeholder/400/200'
  },
  {
    id: 2,
    title: 'เทรนด์ตลาดแรงงานปี 2024: ทักษะไหนที่นายจ้างต้องการมากที่สุด',
    summary: 'วิเคราะห์เทรนด์ตลาดแรงงานและทักษะที่จำเป็นในยุคดิจิทัล รวมถึงการเตรียมตัวสำหรับอนาคต',
    category: 'เทรนด์งาน',
    author: 'ดร.วิภาวี',
    date: '12 ม.ค. 2024',
    readTime: 12,
    image: '/api/placeholder/400/200'
  },
  {
    id: 3,
    title: 'วิธีเขียน Resume ให้โดดเด่นและผ่านระบบ ATS',
    summary: 'เทคนิคการเขียน Resume ที่จะทำให้คุณโดดเด่นจากผู้สมัครคนอื่น ๆ และผ่านระบบคัดกรองอัตโนมัติ',
    category: 'Resume',
    author: 'คุณนิภา',
    date: '10 ม.ค. 2024',
    readTime: 6,
    image: '/api/placeholder/400/200'
  },
  {
    id: 4,
    title: 'การเจรจาเงินเดือน: กลยุทธ์ที่ใช้ได้จริง',
    summary: 'เรียนรู้วิธีการเจรจาเงินเดือนอย่างมืออาชีพ พร้อมตัวอย่างประโยคและเทคนิคที่ได้ผลจริง',
    category: 'เงินเดือน',
    author: 'คุณรัชนี',
    date: '8 ม.ค. 2024',
    readTime: 10,
    image: '/api/placeholder/400/200'
  },
  {
    id: 5,
    title: 'Work-Life Balance: จัดสมดุลชีวิตการทำงานให้ยั่งยืน',
    summary: 'แนวทางการสร้างสมดุลระหว่างชีวิตส่วนตัวและการทำงาน เพื่อความสุขและประสิทธิภาพที่ยั่งยืน',
    category: 'ไลฟ์สไตล์',
    author: 'คุณปรีชา',
    date: '5 ม.ค. 2024',
    readTime: 7,
    image: '/api/placeholder/400/200'
  },
  {
    id: 6,
    title: 'การเปลี่ยนสายอาชีพ: คู่มือสำหรับมือใหม่',
    summary: 'ขั้นตอนและคำแนะนำสำหรับผู้ที่ต้องการเปลี่ยนสายอาชีพ พร้อมเทคนิคการเตรียมตัวและการปรับตัว',
    category: 'เปลี่ยนงาน',
    author: 'คุณสุดา',
    date: '3 ม.ค. 2024',
    readTime: 9,
    image: '/api/placeholder/400/200'
  }
])

// ข้อมูลสถิติ
const statistics = ref([
  {
    number: '250,000+',
    label: 'ผู้หางานที่ประสบความสำเร็จ',
    description: 'ได้งานที่ใฝ่ฝันผ่านแพลตฟอร์มของเรา',
    icon: 'M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z'
  },
  {
    number: '98.5%',
    label: 'อัตราความสำเร็จ',
    description: 'ของผู้ที่ใช้บริการครบ 6 เดือน',
    icon: 'M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z'
  },
  {
    number: '15,000+',
    label: 'ตำแหน่งงานใหม่',
    description: 'เพิ่มขึ้นทุกสัปดาห์จากบริษัทชั้นนำ',
    icon: 'M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z'
  },
  {
    number: '24 ชม.',
    label: 'เวลาตอบกลับเฉลี่ย',
    description: 'จากทีมซัพพอร์ตมืออาชีพ',
    icon: 'M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z'
  }
])

// ฟังก์ชันค้นหางาน
const searchJobs = async () => {
  isLoading.value = true
  
  // จำลองการค้นหา
  await new Promise(resolve => setTimeout(resolve, 2000))
  
  // ในการใช้งานจริง จะเรียก API ที่นี่
  console.log('ค้นหางาน:', searchQuery.value, 'หมวดหมู่:', selectedCategory.value)
  
  isLoading.value = false
  
  // แสดงผลการค้นหา (ในอนาคตจะนำไปหน้าผลการค้นหา)
  alert(`ค้นหา "${searchQuery.value}" ในหมวดหมู่ "${jobCategories.value.find(c => c.id === selectedCategory.value)?.name}"`)
}

// ฟังก์ชันดูรายละเอียดงาน
const viewJobDetails = (jobId: number) => {
  // นำทางไปหน้ารายละเอียดงาน
  navigateTo(`/work/details?id=${jobId}`)
}

// ฟังก์ชันเพิ่ม/ลบรายการโปรด
const toggleFavorite = (jobId: number) => {
  const job = recommendedJobs.value.find(j => j.id === jobId)
  if (job) {
    job.isFavorite = !job.isFavorite
    console.log(`${job.isFavorite ? 'เพิ่ม' : 'ลบ'}งาน "${job.title}" ${job.isFavorite ? 'ใน' : 'จาก'}รายการโปรด`)
  }
}

// ฟังก์ชันดูงานทั้งหมด
const viewAllJobs = () => {
  navigateTo('/work')
}

// ฟังก์ชันดูบทความทั้งหมด
const viewAllArticles = () => {
  navigateTo('/articles')
}

// ฟังก์ชันเริ่มต้นใช้งาน
const getStarted = () => {
  navigateTo('/register')
}

onMounted(() => {
  // โหลดข้อมูลเริ่มต้น
  console.log('หน้าหลักโหลดเสร็จสิ้น')
})
</script>

<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Hero Section with Search -->
    <div class="relative overflow-hidden min-h-screen flex items-center">
      <!-- พื้นหลังแบบมีลูกเล่นและเอฟเฟกต์พิเศษ -->
      <div class="absolute inset-0 bg-gradient-to-br from-green-600 via-green-700 to-emerald-900">
        <!-- Grid Pattern -->
        <div class="absolute inset-0 bg-grid-pattern opacity-10"></div>
        
        <!-- Floating Elements -->
        <div class="absolute top-1/4 left-1/4 w-72 h-72 bg-green-400 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob"></div>
        <div class="absolute top-1/3 right-1/4 w-72 h-72 bg-blue-400 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-2000"></div>
        <div class="absolute bottom-1/4 left-1/3 w-72 h-72 bg-purple-400 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-4000"></div>
        <div class="absolute bottom-1/3 right-1/3 w-80 h-80 bg-yellow-300 rounded-full mix-blend-multiply filter blur-3xl opacity-15 animate-blob animation-delay-6000"></div>
        
        <!-- Sparkle Effects -->
        <div class="absolute top-20 left-20 w-2 h-2 bg-white rounded-full animate-pulse"></div>
        <div class="absolute top-40 right-32 w-1 h-1 bg-green-200 rounded-full animate-ping"></div>
        <div class="absolute bottom-40 left-40 w-1.5 h-1.5 bg-white rounded-full animate-pulse animation-delay-1000"></div>
        <div class="absolute bottom-20 right-20 w-2 h-2 bg-green-200 rounded-full animate-ping animation-delay-2000"></div>
      </div>
      
      <!-- เนื้อหา Hero Section -->
      <div class="relative max-w-7xl mx-auto py-20 px-4 sm:py-28 sm:px-6 lg:px-8 text-center z-10">
        <!-- Premium Badge -->
        <div class="flex justify-center mb-8 animate-fadeIn">
          <div class="inline-flex items-center px-6 py-3 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-white">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-yellow-300" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
            </svg>
            <span class="text-sm font-medium">AI-Powered Job Matching Platform</span>
            <div class="ml-2 px-2 py-1 bg-gradient-to-r from-yellow-400 to-orange-400 text-black text-xs font-bold rounded-full">
              PREMIUM
            </div>
          </div>
        </div>
        
        <!-- หัวข้อหลักแบบไล่เฉดสี -->
        <h1 class="text-5xl md:text-7xl font-black mb-6 animate-fadeIn animation-delay-300">
          <span class="bg-gradient-to-r from-white via-green-100 to-green-200 bg-clip-text text-transparent animate-gradient-x">
            ค้นหางานที่
          </span>
          <br>
          <span class="bg-gradient-to-r from-yellow-300 via-orange-300 to-red-300 bg-clip-text text-transparent animate-gradient-x animation-delay-500">
            ใช่สำหรับคุณ
          </span>
        </h1>
        
        <!-- คำอธิบายแบบมีเอฟเฟกต์ -->
        <p class="mt-6 max-w-3xl mx-auto text-xl text-green-50 leading-relaxed animate-fadeIn animation-delay-600">
          <span class="font-medium bg-gradient-to-r from-white to-green-100 bg-clip-text text-transparent">
            ระบบ AI ที่ทันสมัยที่สุด
          </span>
          จะช่วยจับคู่คุณกับงานที่เหมาะสมที่สุด
          <br>
          <span class="text-green-200">พร้อมโอกาสในการเติบโตและความสำเร็จในอาชีพ</span>
        </p>
        
        <!-- สถิติแบบพรีเมี่ยม -->
        <div class="mt-12 grid grid-cols-2 md:grid-cols-4 gap-8 animate-fadeIn animation-delay-800">
          <div class="text-center group">
            <div class="relative">
              <div class="text-4xl font-bold text-white group-hover:scale-110 transition-transform duration-300">15,000+</div>
              <div class="text-green-100 text-sm mt-1">ตำแหน่งงานใหม่</div>
              <div class="absolute -inset-2 bg-white/5 rounded-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
            </div>
          </div>
          <div class="text-center group">
            <div class="relative">
              <div class="text-4xl font-bold text-white group-hover:scale-110 transition-transform duration-300">98%</div>
              <div class="text-green-100 text-sm mt-1">อัตราความสำเร็จ</div>
              <div class="absolute -inset-2 bg-white/5 rounded-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
            </div>
          </div>
          <div class="text-center group">
            <div class="relative">
              <div class="text-4xl font-bold text-white group-hover:scale-110 transition-transform duration-300">8,500+</div>
              <div class="text-green-100 text-sm mt-1">บริษัทชั้นนำ</div>
              <div class="absolute -inset-2 bg-white/5 rounded-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
            </div>
          </div>
          <div class="text-center group">
            <div class="relative">
              <div class="text-4xl font-bold text-white group-hover:scale-110 transition-transform duration-300">24 ชม.</div>
              <div class="text-green-100 text-sm mt-1">เวลาตอบกลับ</div>
              <div class="absolute -inset-2 bg-white/5 rounded-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
            </div>
          </div>
        </div>
        
        <!-- Search Form แบบพรีเมี่ยม -->
        <div class="mt-16 max-w-4xl mx-auto animate-fadeIn animation-delay-1000">
          <div class="relative">
            <!-- Glow Effect -->
            <div class="absolute -inset-1 bg-gradient-to-r from-green-400 via-blue-500 to-purple-600 rounded-2xl blur opacity-30 group-hover:opacity-50 transition duration-1000"></div>
            
            <div class="relative bg-white/10 backdrop-blur-xl rounded-2xl p-2 border border-white/20 shadow-2xl">
              <div class="flex flex-col md:flex-row gap-2">
                <!-- Search Input -->
                <div class="flex-1 relative">
                  <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                  </div>
                  <input
                    v-model="searchQuery"
                    type="text"
                    placeholder="ค้นหาตำแหน่งงาน, บริษัท, หรือทักษะ..."
                    class="w-full pl-12 pr-4 py-4 bg-white/90 backdrop-blur-sm border-0 rounded-xl text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-white/50 text-lg font-medium shadow-inner"
                  >
                </div>
                
                <!-- Category Select -->
                <div class="md:w-48">
                  <select
                    v-model="selectedCategory"
                    class="w-full px-4 py-4 bg-white/90 backdrop-blur-sm border-0 rounded-xl text-gray-900 focus:outline-none focus:ring-2 focus:ring-white/50 text-lg font-medium shadow-inner"
                  >
                    <option v-for="category in jobCategories" :key="category.id" :value="category.id">
                      {{ category.name }}
                    </option>
                  </select>
                </div>
                
                <!-- Search Button -->
                <button
                  @click="searchJobs"
                  class="px-8 py-4 bg-gradient-to-r from-green-500 to-emerald-600 hover:from-green-600 hover:to-emerald-700 text-white font-bold rounded-xl shadow-lg hover:shadow-xl transform hover:scale-105 transition-all duration-300 flex items-center justify-center group"
                  :class="{'opacity-75 cursor-wait': isLoading}"
                  :disabled="isLoading"
                >
                  <svg v-if="!isLoading" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-2 group-hover:rotate-12 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                  </svg>
                  <svg v-else class="animate-spin h-6 w-6 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  <span class="text-lg">{{ isLoading ? 'กำลังค้นหา...' : 'ค้นหาเลย' }}</span>
                </button>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Scroll Indicator -->
        <div class="mt-16 animate-bounce">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 mx-auto text-white/70" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3" />
          </svg>
        </div>
      </div>
    </div>
    
    <!-- งานแนะนำ -->
    <div class="py-20 bg-gradient-to-br from-gray-50 via-white to-green-50 relative overflow-hidden">
      <!-- Background decorations -->
      <div class="absolute top-0 left-0 w-full h-full">
        <div class="absolute top-20 left-10 w-32 h-32 bg-green-200 rounded-full opacity-20 animate-float"></div>
        <div class="absolute bottom-20 right-10 w-24 h-24 bg-blue-200 rounded-full opacity-20 animate-float animation-delay-2000"></div>
        <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-96 h-96 bg-gradient-to-r from-green-100 to-blue-100 rounded-full opacity-10 animate-pulse"></div>
      </div>
      
      <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <!-- Header Section -->
        <div class="text-center mb-16">
          <div class="inline-flex items-center px-4 py-2 bg-green-100 text-green-800 rounded-full text-sm font-medium mb-4 animate-bounce-in">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
            </svg>
            งานแนะนำสำหรับคุณ
          </div>
          
          <h2 class="text-4xl md:text-5xl font-black text-gray-900 mb-6 animate-fadeIn animation-delay-300">
            <span class="bg-gradient-to-r from-green-600 via-blue-600 to-purple-600 bg-clip-text text-transparent">
              งานที่เหมาะสมที่สุด
            </span>
            <br>
            <span class="text-gray-700">จาก AI ของเรา</span>
          </h2>
          
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed animate-fadeIn animation-delay-600">
            ระบบ AI ของเราวิเคราะห์โปรไฟล์และความสนใจของคุณ 
            เพื่อแนะนำงานที่ตรงใจและเหมาะสมที่สุด
          </p>
        </div>
        
        <!-- Jobs Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div 
            v-for="(job, index) in recommendedJobs" 
            :key="job.id"
            class="group relative bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 overflow-hidden card-hover animate-fadeIn"
            :class="`animation-delay-${800 + index * 200}`"
          >
            <!-- Premium Badge -->
            <div class="absolute top-4 right-4 z-10">
              <div class="bg-gradient-to-r from-yellow-400 to-orange-400 text-white text-xs font-bold px-3 py-1 rounded-full shadow-lg">
                HOT
              </div>
            </div>
            
            <!-- Company Logo Background -->
            <div class="absolute top-0 right-0 w-32 h-32 bg-gradient-to-bl from-green-100 to-transparent opacity-50 rounded-bl-full"></div>
            
            <div class="p-8">
              <!-- Company Info -->
              <div class="flex items-center mb-6">
                <div class="w-16 h-16 bg-gradient-to-br from-green-500 to-emerald-600 rounded-xl flex items-center justify-center text-white font-bold text-xl shadow-lg">
                  {{ job.company.charAt(0) }}
                </div>
                <div class="ml-4">
                  <h3 class="font-bold text-gray-900 text-lg">{{ job.company }}</h3>
                  <p class="text-gray-500 text-sm">{{ job.location }}</p>
                </div>
              </div>
              
              <!-- Job Title -->
              <h4 class="text-xl font-bold text-gray-900 mb-3 group-hover:text-green-700 transition-colors duration-300">
                {{ job.title }}
              </h4>
              
              <!-- Job Details -->
              <div class="space-y-3 mb-6">
                <div class="flex items-center text-gray-600">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1" />
                  </svg>
                  <span class="font-semibold text-green-600">{{ job.salary }}</span>
                </div>
                
                <div class="flex items-center text-gray-600">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3 text-blue-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                  </svg>
                  {{ job.type }}
                </div>
              </div>
              
              <!-- Match Score -->
              <div class="mb-6">
                <div class="flex items-center justify-between mb-2">
                  <span class="text-sm font-medium text-gray-700">ความเหมาะสม</span>
                  <span class="text-sm font-bold text-green-600">{{ job.match }}%</span>
                </div>
                <div class="w-full bg-gray-200 rounded-full h-2 overflow-hidden">
                  <div 
                    class="bg-gradient-to-r from-green-500 to-emerald-500 h-2 rounded-full transition-all duration-1000 ease-out"
                    :style="`width: ${job.match}%`"
                  ></div>
                </div>
              </div>
              
              <!-- Action Buttons -->
              <div class="flex gap-3">
                <button 
                  @click="viewJobDetails(job.id)"
                  class="flex-1 bg-gradient-to-r from-green-500 to-emerald-600 hover:from-green-600 hover:to-emerald-700 text-white font-semibold py-3 px-4 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl"
                >
                  ดูรายละเอียด
                </button>
                <button 
                  class="p-3 bg-gray-100 hover:bg-gray-200 text-gray-600 hover:text-red-500 rounded-xl transition-all duration-300 transform hover:scale-105"
                  @click="toggleFavorite(job.id)"
                >
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                  </svg>
                </button>
              </div>
            </div>
            
            <!-- Hover Glow Effect -->
            <div class="absolute inset-0 bg-gradient-to-r from-green-400/0 via-green-400/5 to-green-400/0 opacity-0 group-hover:opacity-100 transition-opacity duration-500 pointer-events-none"></div>
          </div>
        </div>
        
        <!-- View More Button -->
        <div class="text-center mt-12 animate-fadeIn animation-delay-1500">
          <button 
            @click="viewAllJobs"
            class="inline-flex items-center px-8 py-4 bg-white border-2 border-green-500 text-green-600 font-semibold rounded-xl hover:bg-green-500 hover:text-white transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl group"
          >
            <span>ดูงานทั้งหมด</span>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-2 group-hover:translate-x-1 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
            </svg>
          </button>
        </div>
      </div>
    </div>
    
    <!-- บทความและเคล็ดลับ -->
    <div class="py-20 bg-gradient-to-br from-white via-gray-50 to-blue-50 relative overflow-hidden">
      <!-- Background Elements -->
      <div class="absolute inset-0">
        <div class="absolute top-10 right-10 w-40 h-40 bg-blue-200 rounded-full opacity-20 animate-float animation-delay-1000"></div>
        <div class="absolute bottom-10 left-10 w-32 h-32 bg-purple-200 rounded-full opacity-20 animate-float animation-delay-2000"></div>
        <div class="absolute top-1/2 right-1/4 w-24 h-24 bg-green-200 rounded-full opacity-30 animate-pulse animation-delay-3000"></div>
      </div>
      
      <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <!-- Header -->
        <div class="text-center mb-16">
          <div class="inline-flex items-center px-4 py-2 bg-blue-100 text-blue-800 rounded-full text-sm font-medium mb-4 animate-bounce-in">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
            </svg>
            เคล็ดลับและบทความ
          </div>
          
          <h2 class="text-4xl md:text-5xl font-black text-gray-900 mb-6 animate-fadeIn animation-delay-300">
            <span class="bg-gradient-to-r from-blue-600 via-purple-600 to-pink-600 bg-clip-text text-transparent">
              เคล็ดลับสำหรับ
            </span>
            <br>
            <span class="text-gray-700">การหางานที่สำเร็จ</span>
          </h2>
          
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed animate-fadeIn animation-delay-600">
            อัปเดตเทรนด์ตลาดแรงงาน เคล็ดลับการสัมภาษณ์ และคำแนะนำจากผู้เชี่ยวชาญ
          </p>
        </div>
        
        <!-- Articles Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-16">
          <article 
            v-for="(article, index) in careerArticles" 
            :key="article.id"
            class="group bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 overflow-hidden card-hover animate-fadeIn"
            :class="`animation-delay-${800 + index * 200}`"
          >
            <!-- Article Image -->
            <div class="relative h-48 bg-gradient-to-br from-blue-400 via-purple-500 to-pink-500 overflow-hidden">
              <div class="absolute inset-0 bg-black/20"></div>
              <div class="absolute inset-0 flex items-center justify-center">
                <div class="w-16 h-16 bg-white/20 backdrop-blur-sm rounded-full flex items-center justify-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                  </svg>
                </div>
              </div>
              
              <!-- Category Badge -->
              <div class="absolute top-4 left-4">
                <span class="bg-white/90 backdrop-blur-sm text-gray-800 text-xs font-bold px-3 py-1 rounded-full">
                  {{ article.category }}
                </span>
              </div>
              
              <!-- Reading Time -->
              <div class="absolute top-4 right-4">
                <span class="bg-black/50 backdrop-blur-sm text-white text-xs font-medium px-2 py-1 rounded-full">
                  {{ article.readTime }} นาที
                </span>
              </div>
            </div>
            
            <div class="p-6">
              <!-- Article Title -->
              <h3 class="text-xl font-bold text-gray-900 mb-3 group-hover:text-blue-600 transition-colors duration-300 line-clamp-2">
                {{ article.title }}
              </h3>
              
              <!-- Article Summary -->
              <p class="text-gray-600 mb-4 line-clamp-3">
                {{ article.summary }}
              </p>
              
              <!-- Article Meta -->
              <div class="flex items-center justify-between text-sm text-gray-500 mb-4">
                <div class="flex items-center">
                  <div class="w-8 h-8 bg-gradient-to-br from-blue-500 to-purple-600 rounded-full flex items-center justify-center text-white font-bold text-xs mr-2">
                    {{ article.author.charAt(0) }}
                  </div>
                  <span>{{ article.author }}</span>
                </div>
                <span>{{ article.date }}</span>
              </div>
              
              <!-- Read More Button -->
              <button class="w-full bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl group">
                <span>อ่านบทความ</span>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 ml-2 inline group-hover:translate-x-1 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                </svg>
              </button>
            </div>
            
            <!-- Hover Glow Effect -->
            <div class="absolute inset-0 bg-gradient-to-r from-blue-400/0 via-blue-400/5 to-purple-400/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500 pointer-events-none"></div>
          </article>
        </div>
        
        <!-- View All Articles Button -->
        <div class="text-center animate-fadeIn animation-delay-1500">
          <button class="inline-flex items-center px-8 py-4 bg-white border-2 border-blue-500 text-blue-600 font-semibold rounded-xl hover:bg-blue-500 hover:text-white transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl group">
            <span>ดูบทความทั้งหมด</span>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-2 group-hover:translate-x-1 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
            </svg>
          </button>
        </div>
      </div>
    </div>

    <!-- สถิติและความสำเร็จ -->
    <div class="py-20 bg-gradient-to-br from-green-600 via-emerald-700 to-teal-800 relative overflow-hidden">
      <!-- Background Effects -->
      <div class="absolute inset-0">
        <div class="absolute top-0 left-0 w-full h-full bg-grid-pattern opacity-10"></div>
        <div class="absolute top-1/4 left-1/4 w-64 h-64 bg-white rounded-full opacity-5 animate-pulse"></div>
        <div class="absolute bottom-1/4 right-1/4 w-48 h-48 bg-yellow-300 rounded-full opacity-10 animate-float"></div>
        <div class="absolute top-1/2 right-1/3 w-32 h-32 bg-blue-300 rounded-full opacity-10 animate-float animation-delay-2000"></div>
      </div>
      
      <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <!-- Header -->
        <div class="text-center mb-16">
          <div class="inline-flex items-center px-4 py-2 bg-white/10 backdrop-blur-md border border-white/20 text-white rounded-full text-sm font-medium mb-4 animate-bounce-in">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2 text-yellow-300" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
            </svg>
            ความสำเร็จของเรา
          </div>
          
          <h2 class="text-4xl md:text-5xl font-black text-white mb-6 animate-fadeIn animation-delay-300">
            <span class="bg-gradient-to-r from-yellow-300 via-orange-300 to-red-300 bg-clip-text text-transparent animate-gradient-x">
              ตัวเลขที่พิสูจน์
            </span>
            <br>
            <span class="text-green-100">ความเป็นเลิศของเรา</span>
          </h2>
          
          <p class="text-xl text-green-100 max-w-3xl mx-auto leading-relaxed animate-fadeIn animation-delay-600">
            ผลงานและความสำเร็จที่เราภูมิใจ จากการช่วยเหลือผู้หางานหลายแสนคน
          </p>
        </div>
        
        <!-- Statistics Grid -->
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
          <div 
            v-for="(stat, index) in statistics" 
            :key="index"
            class="text-center group animate-fadeIn"
            :class="`animation-delay-${800 + index * 200}`"
          >
            <div class="relative">
              <!-- Glow Effect -->
              <div class="absolute -inset-4 bg-white/10 rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
              
              <div class="relative bg-white/5 backdrop-blur-sm rounded-2xl p-8 border border-white/10 hover:border-white/20 transition-all duration-300 transform hover:scale-105">
                <!-- Icon -->
                <div class="w-16 h-16 mx-auto mb-4 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-xl flex items-center justify-center shadow-lg">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" :d="stat.icon" />
                  </svg>
                </div>
                
                <!-- Number -->
                <div class="text-4xl md:text-5xl font-black text-white mb-2 group-hover:scale-110 transition-transform duration-300">
                  {{ stat.number }}
                </div>
                
                <!-- Label -->
                <div class="text-green-100 font-medium">
                  {{ stat.label }}
                </div>
                
                <!-- Description -->
                <div class="text-green-200 text-sm mt-2 opacity-80">
                  {{ stat.description }}
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Call to Action -->
        <div class="text-center mt-16 animate-fadeIn animation-delay-1500">
          <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 max-w-2xl mx-auto">
            <h3 class="text-2xl font-bold text-white mb-4">
              พร้อมเริ่มต้นการเดินทางสู่ความสำเร็จแล้วหรือยัง?
            </h3>
            <p class="text-green-100 mb-6">
              เข้าร่วมกับผู้หางานหลายแสนคนที่เชื่อมั่นในระบบของเรา
            </p>
            <button class="bg-gradient-to-r from-yellow-400 to-orange-500 hover:from-yellow-500 hover:to-orange-600 text-white font-bold py-4 px-8 rounded-xl shadow-lg hover:shadow-xl transform hover:scale-105 transition-all duration-300">
              เริ่มต้นเลย
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>