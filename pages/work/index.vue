<script setup lang="ts">
import { ref, reactive, computed } from 'vue'

// ข้อมูลสำหรับการค้นหา
const searchQuery = ref('')
const selectedCategory = ref('all')
const isLoading = ref(false)
const isAiAnalyzing = ref(false)
const selectedFile = ref(null)
const aiMatchResults = ref(null)

// ข้อมูลหมวดหมู่งาน
const categories = [
  { id: 'all', name: 'ทั้งหมด' },
  { id: 'tech', name: 'เทคโนโลยี' },
  { id: 'marketing', name: 'การตลาด' },
  { id: 'design', name: 'ออกแบบ' },
  { id: 'finance', name: 'การเงิน' },
  { id: 'health', name: 'สุขภาพ' }
]

// ข้อมูลงาน (ตัวอย่าง)
const jobs = reactive([
  {
    id: 1,
    title: 'นักพัฒนา Full Stack',
    company: 'เทคโนโลยี อินโนเวชั่น จำกัด',
    location: 'กรุงเทพฯ (ทำงานที่ออฟฟิศ)',
    salary: '60,000 - 90,000 บาท',
    matchScore: 95,
    tags: ['JavaScript', 'Vue.js', 'Node.js', 'MongoDB'],
    logo: 'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
    postedDate: '2 วันที่แล้ว',
    isFavorite: true,
    description: 'บริษัทเทคโนโลยีชั้นนำกำลังมองหานักพัฒนา Full Stack ที่มีประสบการณ์ในการทำงานกับ JavaScript, Vue.js, Node.js และ MongoDB เพื่อร่วมพัฒนาผลิตภัณฑ์ที่มีผู้ใช้งานหลายล้านคนทั่วโลก',
    category: 'tech'
  },
  {
    id: 2,
    title: 'ผู้จัดการฝ่ายการตลาดดิจิทัล',
    company: 'มาร์เก็ตติ้ง โปร จำกัด',
    location: 'กรุงเทพฯ (ทำงานที่ออฟฟิศ)',
    salary: '70,000 - 100,000 บาท',
    matchScore: 88,
    tags: ['Digital Marketing', 'SEO', 'SEM', 'Content Strategy'],
    logo: 'https://images.unsplash.com/photo-1568822617270-2c1579f8dfe2?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
    postedDate: '3 วันที่แล้ว',
    isFavorite: false,
    description: 'เรากำลังมองหาผู้จัดการฝ่ายการตลาดดิจิทัลที่มีประสบการณ์ในการวางแผนและดำเนินกลยุทธ์การตลาดออนไลน์ ผู้สมัครควรมีความเชี่ยวชาญใน SEO, SEM และการสร้างเนื้อหาที่มีคุณภาพ',
    category: 'marketing'
  },
  {
    id: 3,
    title: 'นักออกแบบ UX/UI',
    company: 'ครีเอทีฟ ดีไซน์ จำกัด',
    location: 'เชียงใหม่ (ทำงานระยะไกล)',
    salary: '45,000 - 65,000 บาท',
    matchScore: 92,
    tags: ['Figma', 'Adobe XD', 'User Research', 'Prototyping'],
    logo: 'https://images.unsplash.com/photo-1561070791-2526d30994b5?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
    postedDate: 'วันนี้',
    isFavorite: true,
    description: 'บริษัทออกแบบชั้นนำกำลังมองหานักออกแบบ UX/UI ที่มีความคิดสร้างสรรค์และมีประสบการณ์ในการออกแบบส่วนติดต่อผู้ใช้ที่สวยงามและใช้งานง่าย ผู้สมัครควรมีทักษะในการใช้ Figma, Adobe XD และมีความเข้าใจในการทำวิจัยผู้ใช้',
    category: 'design'
  },
  {
    id: 4,
    title: 'นักวิเคราะห์การเงิน',
    company: 'ไฟแนนซ์ โซลูชั่น จำกัด',
    location: 'กรุงเทพฯ (ไฮบริด)',
    salary: '50,000 - 70,000 บาท',
    matchScore: 85,
    tags: ['Financial Analysis', 'Excel', 'Financial Modeling', 'Forecasting'],
    logo: 'https://images.unsplash.com/photo-1551135049-8a33b5883817?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
    postedDate: '1 สัปดาห์ที่แล้ว',
    isFavorite: false,
    description: 'บริษัทที่ปรึกษาทางการเงินกำลังมองหานักวิเคราะห์การเงินที่มีประสบการณ์ในการวิเคราะห์ข้อมูลทางการเงิน การสร้างแบบจำลองทางการเงิน และการคาดการณ์ ผู้สมัครควรมีทักษะการใช้ Excel ขั้นสูง',
    category: 'finance'
  },
  {
    id: 5,
    title: 'พยาบาลวิชาชีพ',
    company: 'โรงพยาบาลเฮลท์แคร์',
    location: 'ขอนแก่น (ทำงานที่ออฟฟิศ)',
    salary: '35,000 - 45,000 บาท',
    matchScore: 78,
    tags: ['Patient Care', 'Medical Records', 'Clinical Procedures'],
    logo: 'https://images.unsplash.com/photo-1550831107-1553da8c8464?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
    postedDate: '2 สัปดาห์ที่แล้ว',
    isFavorite: false,
    description: 'โรงพยาบาลชั้นนำกำลังมองหาพยาบาลวิชาชีพที่มีใบอนุญาตและมีประสบการณ์ในการดูแลผู้ป่วย ผู้สมัครควรมีความรู้เกี่ยวกับขั้นตอนทางคลินิกและการจัดการเวชระเบียน',
    category: 'health'
  },
  {
    id: 6,
    title: 'วิศวกรซอฟต์แวร์ (Backend)',
    company: 'อินโนเวทีฟ เทค จำกัด',
    location: 'กรุงเทพฯ (ไฮบริด)',
    salary: '70,000 - 120,000 บาท',
    matchScore: 90,
    tags: ['Java', 'Spring Boot', 'Microservices', 'AWS'],
    logo: 'https://images.unsplash.com/photo-1560179707-f14e90ef3623?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
    postedDate: '4 วันที่แล้ว',
    isFavorite: true,
    description: 'บริษัทเทคโนโลยีกำลังมองหาวิศวกรซอฟต์แวร์ Backend ที่มีประสบการณ์ในการพัฒนาด้วย Java และ Spring Boot ผู้สมัครควรมีความรู้เกี่ยวกับสถาปัตยกรรม Microservices และการใช้งาน AWS',
    category: 'tech'
  }
])

// กรองงานตามการค้นหาและหมวดหมู่
const filteredJobs = computed(() => {
  return jobs.filter(job => {
    // กรองตามหมวดหมู่
    const categoryMatch = selectedCategory.value === 'all' || job.category === selectedCategory.value
    
    // กรองตามคำค้นหา
    const searchMatch = job.title.toLowerCase().includes(searchQuery.value.toLowerCase()) || 
                        job.company.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
                        job.description.toLowerCase().includes(searchQuery.value.toLowerCase())
    
    return categoryMatch && searchMatch
  })
})

// ฟังก์ชันค้นหางาน
const searchJobs = () => {
  isLoading.value = true
  
  // จำลองการเรียก API
  setTimeout(() => {
    isLoading.value = false
  }, 800)
}

// ฟังก์ชันเมื่อเลือกไฟล์
const handleFileChange = (event) => {
  selectedFile.value = event.target.files[0]
}

// ฟังก์ชันวิเคราะห์ไฟล์ด้วย AI
const analyzeWithAI = () => {
  if (!selectedFile.value) return
  
  isAiAnalyzing.value = true
  
  // จำลองการวิเคราะห์ด้วย AI
  setTimeout(() => {
    isAiAnalyzing.value = false
    
    // สร้างผลลัพธ์จำลอง
    aiMatchResults.value = {
      topMatches: [
        { jobId: 1, score: 95, reason: 'ทักษะและประสบการณ์ของคุณตรงกับความต้องการของตำแหน่งนี้อย่างมาก' },
        { jobId: 6, score: 90, reason: 'ประวัติการทำงานของคุณสอดคล้องกับความต้องการของบริษัทนี้' },
        { jobId: 3, score: 82, reason: 'คุณมีทักษะบางส่วนที่ตรงกับตำแหน่งนี้ แต่อาจต้องการการพัฒนาเพิ่มเติม' }
      ],
      skills: {
        strong: ['JavaScript', 'React', 'Node.js', 'API Development'],
        recommended: ['AWS', 'Docker', 'TypeScript']
      },
      summary: 'จากการวิเคราะห์ประวัติของคุณ คุณมีความเหมาะสมอย่างมากกับตำแหน่งงานด้านการพัฒนาซอฟต์แวร์ โดยเฉพาะตำแหน่ง Full Stack Developer และ Backend Developer'
    }
  }, 2000)
}

// ฟังก์ชันเปลี่ยนสถานะการถูกใจ
const toggleFavorite = (jobId) => {
  const job = jobs.find(j => j.id === jobId)
  if (job) {
    job.isFavorite = !job.isFavorite
  }
}
</script>

<template>
  <div class="bg-gray-50 min-h-screen">
    <!-- ส่วนหัวของหน้า -->
    <div class="bg-gradient-to-r from-green-700 to-green-500 py-12">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 class="text-3xl font-extrabold text-white sm:text-4xl text-center mb-6">
          ค้นหางานที่เหมาะกับคุณ
        </h1>
        <p class="text-xl text-green-100 text-center max-w-3xl mx-auto">
          ค้นพบโอกาสในการทำงานที่เหมาะสมกับทักษะและความสนใจของคุณ
        </p>
        
        <!-- ส่วนค้นหา -->
        <div class="mt-8 max-w-3xl mx-auto">
          <div class="bg-white rounded-lg shadow-md p-4">
            <div class="flex flex-col md:flex-row gap-4">
              <div class="flex-grow">
                <input 
                  type="text" 
                  v-model="searchQuery" 
                  placeholder="ค้นหาตำแหน่งงาน บริษัท หรือทักษะ" 
                  class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-green-500"
                  @keyup.enter="searchJobs"
                />
              </div>
              <button 
                @click="searchJobs" 
                class="bg-green-600 hover:bg-green-700 text-white font-medium py-2 px-6 rounded-md transition duration-150 ease-in-out flex items-center justify-center"
                :disabled="isLoading"
              >
                <span v-if="isLoading" class="mr-2">
                  <svg class="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                </span>
                <span>{{ isLoading ? 'กำลังค้นหา...' : 'ค้นหา' }}</span>
              </button>
            </div>
            
            <!-- ตัวกรองหมวดหมู่ -->
            <div class="mt-4 flex flex-wrap gap-2">
              <button 
                v-for="category in categories" 
                :key="category.id"
                @click="selectedCategory = category.id"
                :class="[
                  'px-4 py-2 rounded-full text-sm font-medium transition-colors duration-150',
                  selectedCategory === category.id 
                    ? 'bg-green-100 text-green-800 border border-green-300' 
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200 border border-transparent'
                ]"
              >
                {{ category.name }}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- ส่วนเนื้อหาหลัก -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- ส่วนอัปโหลดไฟล์เพื่อวิเคราะห์ด้วย AI -->
      <div class="bg-white rounded-lg shadow-md p-6 mb-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-4">วิเคราะห์ประวัติของคุณด้วย AI</h2>
        <p class="text-gray-600 mb-6">อัปโหลดเรซูเม่ของคุณเพื่อให้ AI วิเคราะห์และแนะนำงานที่เหมาะกับคุณ</p>
        
        <div class="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center">
          <input 
            type="file" 
            id="resume-upload" 
            class="hidden" 
            accept=".pdf,.doc,.docx" 
            @change="handleFileChange"
          />
          <label 
            for="resume-upload" 
            class="cursor-pointer flex flex-col items-center justify-center"
          >
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-gray-400 mb-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12" />
            </svg>
            <span class="text-gray-700 font-medium">คลิกเพื่ออัปโหลดเรซูเม่</span>
            <span class="text-gray-500 text-sm mt-1">รองรับไฟล์ PDF, DOC, DOCX</span>
          </label>
          
          <div v-if="selectedFile" class="mt-4 text-left bg-gray-50 p-3 rounded-md">
            <div class="flex items-center justify-between">
              <div class="flex items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-500 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
                <span class="text-gray-700">{{ selectedFile.name }}</span>
              </div>
              <button 
                @click="selectedFile = null" 
                class="text-gray-500 hover:text-gray-700 focus:outline-none"
              >
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>
          </div>
        </div>
        
        <div class="mt-6">
          <button 
            @click="analyzeWithAI" 
            class="w-full bg-green-600 hover:bg-green-700 text-white font-medium py-3 px-4 rounded-md transition duration-150 ease-in-out flex items-center justify-center"
            :disabled="!selectedFile || isAiAnalyzing"
          >
            <span v-if="isAiAnalyzing" class="mr-2">
              <svg class="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
            </span>
            <span>{{ isAiAnalyzing ? 'กำลังวิเคราะห์...' : 'วิเคราะห์ด้วย AI' }}</span>
          </button>
        </div>
      </div>
      
      <!-- ส่วนแสดงผลลัพธ์การวิเคราะห์ของ AI -->
      <div v-if="aiMatchResults" class="bg-white rounded-lg shadow-md p-6 mb-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-4">ผลการวิเคราะห์ของ AI</h2>
        
        <div class="mb-6">
          <h3 class="text-lg font-semibold text-gray-700 mb-2">สรุปผล</h3>
          <p class="text-gray-600">{{ aiMatchResults.summary }}</p>
        </div>
        
        <div class="mb-6">
          <h3 class="text-lg font-semibold text-gray-700 mb-3">งานที่แนะนำ</h3>
          <div class="space-y-4">
            <div v-for="match in aiMatchResults.topMatches" :key="match.jobId" class="bg-green-50 rounded-lg p-4 border border-green-100">
              <div class="flex justify-between items-center">
                <div class="flex items-center">
                  <div class="bg-green-100 text-green-800 text-lg font-bold rounded-full h-10 w-10 flex items-center justify-center mr-3">
                    {{ match.score }}%
                  </div>
                  <div>
                    <h4 class="font-medium text-gray-800">{{ jobs.find(j => j.id === match.jobId)?.title }}</h4>
                    <p class="text-gray-600 text-sm">{{ jobs.find(j => j.id === match.jobId)?.company }}</p>
                  </div>
                </div>
                <button class="bg-green-600 hover:bg-green-700 text-white text-sm font-medium py-2 px-4 rounded-md transition duration-150 ease-in-out">
                  ดูรายละเอียด
                </button>
              </div>
              <p class="text-gray-600 mt-2 text-sm">{{ match.reason }}</p>
            </div>
          </div>
        </div>
        
        <div>
          <h3 class="text-lg font-semibold text-gray-700 mb-3">ทักษะของคุณ</h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <h4 class="text-sm font-medium text-gray-700 mb-2">ทักษะที่โดดเด่น</h4>
              <div class="flex flex-wrap gap-2">
                <span v-for="(skill, index) in aiMatchResults.skills.strong" :key="index" class="bg-green-100 text-green-800 text-xs px-3 py-1 rounded-full">
                  {{ skill }}
                </span>
              </div>
            </div>
            <div>
              <h4 class="text-sm font-medium text-gray-700 mb-2">ทักษะที่แนะนำให้พัฒนา</h4>
              <div class="flex flex-wrap gap-2">
                <span v-for="(skill, index) in aiMatchResults.skills.recommended" :key="index" class="bg-gray-100 text-gray-800 text-xs px-3 py-1 rounded-full">
                  {{ skill }}
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- ส่วนแสดงรายการงาน -->
      <h2 class="text-2xl font-bold text-gray-800 mb-6">งานที่แนะนำสำหรับคุณ</h2>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- แสดงรายการงาน -->
        <div v-for="job in filteredJobs" :key="job.id" class="bg-white rounded-lg shadow-md overflow-hidden border border-gray-200 hover:shadow-lg transition-shadow duration-300">
          <div class="p-5">
            <div class="flex justify-between items-start">
              <div class="flex items-center">
                <img :src="job.logo" alt="company logo" class="h-10 w-10 rounded-full mr-3 object-cover" />
                <div>
                  <h3 class="font-semibold text-lg text-gray-800">{{ job.title }}</h3>
                  <p class="text-gray-600">{{ job.company }}</p>
                </div>
              </div>
              <button @click="toggleFavorite(job.id)" class="text-gray-400 hover:text-red-500 focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" :class="{ 'text-red-500 fill-current': job.isFavorite }" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                </svg>
              </button>
            </div>
            
            <div class="mt-4">
              <div class="flex items-center text-gray-600 text-sm mb-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                </svg>
                {{ job.location }}
              </div>
              <div class="flex items-center text-gray-600 text-sm">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                {{ job.salary }}
              </div>
            </div>
            
            <div class="mt-4 flex flex-wrap gap-2">
              <span v-for="(tag, index) in job.tags" :key="index" class="bg-green-50 text-green-700 text-xs px-2 py-1 rounded-full">
                {{ tag }}
              </span>
            </div>
            
            <div class="mt-4 flex justify-between items-center">
              <div class="flex items-center">
                <div class="bg-green-100 text-green-800 text-xs font-medium px-2.5 py-0.5 rounded-full flex items-center">
                  <svg class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                  </svg>
                  {{ job.matchScore }}% แมช
                </div>
              </div>
              <span class="text-gray-500 text-sm">โพสต์: {{ job.postedDate }}</span>
            </div>
            
            <div class="mt-4 pt-4 border-t border-gray-100">
              <button class="w-full bg-green-600 hover:bg-green-700 text-white font-medium py-2 px-4 rounded-md transition duration-150 ease-in-out">
                ดูรายละเอียด
              </button>
            </div>
          </div>
        </div>
        
        <!-- ข้อความเมื่อไม่พบงาน -->
        <div v-if="filteredJobs.length === 0" class="col-span-1 md:col-span-2 lg:col-span-3 text-center py-12">
          <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <h3 class="mt-2 text-sm font-medium text-gray-900">ไม่พบงานที่ตรงกับการค้นหา</h3>
          <p class="mt-1 text-sm text-gray-500">ลองเปลี่ยนคำค้นหาหรือหมวดหมู่ที่คุณเลือก</p>
        </div>
      </div>
    </div>
  </div>
</template>