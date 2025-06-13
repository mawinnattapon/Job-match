<script setup lang="ts">
import { ref } from 'vue'

// สถานะสำหรับการค้นหา
const searchQuery = ref('')
const selectedCategory = ref('all')

// สถานะสำหรับการแสดงผลงานที่แนะนำ
const isLoading = ref(false)
const matchScore = ref(85)

// ข้อมูลตัวอย่างงานที่แนะนำ
const recommendedJobs = [
  {
    id: 1,
    title: 'นักพัฒนาเว็บไซต์ (Frontend)',
    company: 'บริษัท เทคโนโลยีดิจิทัล จำกัด',
    location: 'กรุงเทพฯ',
    salary: '45,000 - 70,000 บาท',
    matchScore: 95,
    tags: ['Vue.js', 'React', 'JavaScript', 'Tailwind CSS'],
    logo: 'https://images.unsplash.com/photo-1549924231-f129b911e442?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
    posted: '2 วันที่แล้ว',
    isFavorite: false
  },
  {
    id: 2,
    title: 'นักพัฒนาซอฟต์แวร์ (Full Stack)',
    company: 'บริษัท สตาร์ทอัพเทค จำกัด',
    location: 'กรุงเทพฯ',
    salary: '60,000 - 90,000 บาท',
    matchScore: 88,
    tags: ['Node.js', 'TypeScript', 'MongoDB', 'Express'],
    logo: 'https://images.unsplash.com/photo-1572044162444-ad60f128bdea?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
    posted: '1 วันที่แล้ว',
    isFavorite: true
  },
  {
    id: 3,
    title: 'นักวิเคราะห์ข้อมูล (Data Analyst)',
    company: 'บริษัท ดาต้าซายน์ จำกัด',
    location: 'กรุงเทพฯ',
    salary: '40,000 - 65,000 บาท',
    matchScore: 82,
    tags: ['SQL', 'Python', 'Data Visualization', 'Excel'],
    logo: 'https://images.unsplash.com/photo-1568034097654-a0f5f5c0a2b5?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
    posted: '3 วันที่แล้ว',
    isFavorite: false
  }
]

// ข้อมูลตัวอย่างงานที่ค้นหา
const searchResults = ref([])

// ข้อมูลบทความและคำแนะนำ
const careerArticles = [
  {
    id: 1,
    title: 'เทคนิคการสร้าง Resume ที่ดึงดูด HR',
    excerpt: 'เรียนรู้วิธีสร้างเรซูเม่ที่โดดเด่นและผ่านการคัดกรองจาก HR ด้วยเทคนิคที่ผ่านการพิสูจน์แล้ว',
    image: 'https://images.unsplash.com/photo-1586281380349-632531db7ed4?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    readTime: '5 นาที'
  },
  {
    id: 2,
    title: 'เตรียมตัวให้พร้อมสำหรับการสัมภาษณ์งานแบบมืออาชีพ',
    excerpt: 'คำถามที่มักเจอบ่อยในการสัมภาษณ์งานและวิธีตอบที่จะทำให้คุณโดดเด่นกว่าผู้สมัครคนอื่น',
    image: 'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    readTime: '7 นาที'
  },
  {
    id: 3,
    title: 'ทักษะที่จำเป็นสำหรับตลาดงานยุค AI',
    excerpt: 'อนาคตของการทำงานกำลังเปลี่ยนไป เรียนรู้ทักษะที่จะช่วยให้คุณประสบความสำเร็จในยุค AI',
    image: 'https://images.unsplash.com/photo-1535378620166-273708d44e4c?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    readTime: '6 นาที'
  }
]

// ข้อมูลสถิติ
const statistics = [
  { id: 1, value: '10,000+', label: 'ตำแหน่งงานว่าง' },
  { id: 2, value: '5,000+', label: 'บริษัทชั้นนำ' },
  { id: 3, value: '95%', label: 'อัตราการจับคู่สำเร็จ' },
  { id: 4, value: '48 ชม.', label: 'เวลาตอบกลับเฉลี่ย' }
]

// ฟังก์ชันสำหรับค้นหางาน
const searchJobs = () => {
  isLoading.value = true
  // จำลองการเรียก API
  setTimeout(() => {
    isLoading.value = false
  }, 1000)
}

// ประเภทงาน
const jobCategories = [
  { id: 'all', name: 'ทั้งหมด' },
  { id: 'tech', name: 'เทคโนโลยี' },
  { id: 'marketing', name: 'การตลาด' },
  { id: 'design', name: 'ออกแบบ' },
  { id: 'finance', name: 'การเงิน' },
  { id: 'healthcare', name: 'สุขภาพ' },
]
</script>

<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Hero Section with Search -->
    <div class="bg-gradient-to-r from-green-600 to-green-700 pb-32">
      <div class="max-w-7xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:px-8 text-center">
        <h1 class="text-4xl font-extrabold tracking-tight text-white sm:text-5xl lg:text-6xl">
          ค้นหางานที่ใช่สำหรับคุณ
        </h1>
        <p class="mt-6 max-w-lg mx-auto text-xl text-green-100 sm:max-w-3xl">
          ระบบ AI ของเราจะช่วยจับคู่คุณกับงานที่เหมาะสมที่สุดตามทักษะและประสบการณ์ของคุณ
        </p>
        
        <!-- Search Form -->
        <div class="mt-10 max-w-xl mx-auto">
          <div class="flex rounded-md shadow-sm">
            <div class="relative flex items-stretch flex-grow">
              <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
              </div>
              <input 
                v-model="searchQuery" 
                type="text" 
                class="focus:ring-green-500 focus:border-green-500 block w-full rounded-none rounded-l-md pl-10 sm:text-sm border-gray-300" 
                placeholder="ค้นหาตำแหน่งงาน, บริษัท, หรือทักษะ"
              >
            </div>
            <button 
              @click="searchJobs" 
              class="-ml-px relative inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-r-md text-white bg-green-800 hover:bg-green-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
              :class="{'opacity-75 cursor-wait': isLoading}"
              :disabled="isLoading"
            >
              <span v-if="isLoading">
                <svg class="animate-spin -ml-1 mr-2 h-4 w-4 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                  <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                  <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
              </span>
              <span>ค้นหา</span>
            </button>
          </div>
          
          <!-- Categories Filter -->
          <div class="mt-5 flex flex-wrap justify-center gap-2">
            <button 
              v-for="category in jobCategories" 
              :key="category.id"
              @click="selectedCategory = category.id"
              class="px-4 py-2 text-sm font-medium rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
              :class="selectedCategory === category.id ? 'bg-white text-green-800' : 'bg-green-700 text-white hover:bg-green-800'"
            >
              {{ category.name }}
            </button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- ส่วนแสดงงานที่แนะนำ -->
    <div class="-mt-24 relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="bg-white rounded-lg shadow-lg overflow-hidden">
        <div class="p-6">
          <div class="flex items-center justify-between mb-6">
            <h2 class="text-2xl font-bold text-gray-900">งานที่แนะนำสำหรับคุณ</h2>
            <div class="flex items-center">
              <span class="text-sm text-gray-500 mr-2">ความเข้ากันกับโปรไฟล์ของคุณ:</span>
              <div class="flex items-center bg-green-100 text-green-800 text-sm font-medium px-3 py-1 rounded-full">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                {{ matchScore }}%
              </div>
            </div>
          </div>
          
          <!-- รายการงานที่แนะนำ -->
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div v-for="job in recommendedJobs" :key="job.id" class="bg-white border border-gray-200 rounded-lg shadow-sm hover:shadow-md transition-shadow duration-300 overflow-hidden">
              <div class="p-5">
                <div class="flex justify-between">
                  <div class="flex items-start">
                    <img :src="job.logo" alt="Company logo" class="w-10 h-10 rounded-full mr-3">
                    <div>
                      <h3 class="text-lg font-semibold text-gray-900 mb-1">{{ job.title }}</h3>
                      <p class="text-gray-600 text-sm">{{ job.company }}</p>
                    </div>
                  </div>
                  <button class="text-gray-400 hover:text-green-600 focus:outline-none">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" :class="{'text-green-600 fill-current': job.isFavorite}" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                    </svg>
                  </button>
                </div>
                
                <div class="mt-4 flex items-center text-sm text-gray-500">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                  {{ job.location }}
                </div>
                
                <div class="mt-2 flex items-center text-sm text-gray-500">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  {{ job.salary }}
                </div>
                
                <div class="mt-4">
                  <div class="flex flex-wrap gap-2">
                    <span v-for="(tag, index) in job.tags" :key="index" class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                      {{ tag }}
                    </span>
                  </div>
                </div>
                
                <div class="mt-5 flex justify-between items-center">
                  <div class="flex items-center">
                    <div class="flex items-center bg-green-50 text-green-700 text-xs font-medium px-2 py-1 rounded-full">
                      <svg xmlns="http://www.w3.org/2000/svg" class="h-3 w-3 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                      </svg>
                      {{ job.matchScore }}% เข้ากัน
                    </div>
                  </div>
                  <span class="text-xs text-gray-500">โพสต์ {{ job.posted }}</span>
                </div>
                
                <div class="mt-4">
                  <button class="w-full flex justify-center items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                    ดูรายละเอียด
                  </button>
                </div>
              </div>
            </div>
          </div>
          
          <div class="mt-8 text-center">
            <button class="inline-flex items-center px-4 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
              ดูงานที่แนะนำทั้งหมด
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
              </svg>
            </button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- ส่วนบทความและคำแนะนำ -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 mt-8">
      <div class="text-center mb-12">
        <h2 class="text-3xl font-extrabold text-gray-900 sm:text-4xl">
          คำแนะนำและบทความที่มีประโยชน์
        </h2>
        <p class="mt-3 max-w-2xl mx-auto text-xl text-gray-500 sm:mt-4">
          เรียนรู้เคล็ดลับในการหางานและพัฒนาอาชีพของคุณ
        </p>
      </div>
      
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div v-for="article in careerArticles" :key="article.id" class="flex flex-col rounded-lg shadow-lg overflow-hidden">
          <div class="flex-shrink-0">
            <img class="h-48 w-full object-cover" :src="article.image" alt="">
          </div>
          <div class="flex-1 bg-white p-6 flex flex-col justify-between">
            <div class="flex-1">
              <h3 class="text-xl font-semibold text-gray-900">
                {{ article.title }}
              </h3>
              <p class="mt-3 text-base text-gray-500">
                {{ article.excerpt }}
              </p>
            </div>
            <div class="mt-6 flex items-center">
              <div class="flex-shrink-0">
                <span class="inline-flex items-center px-3 py-0.5 rounded-full text-sm font-medium bg-green-100 text-green-800">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  {{ article.readTime }}
                </span>
              </div>
              <div class="ml-auto">
                <button class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-green-700 bg-green-100 hover:bg-green-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                  อ่านเพิ่มเติม
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                  </svg>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- ส่วนแสดงสถิติ -->
    <div class="bg-green-700 py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-10">
          <h2 class="text-3xl font-extrabold text-white sm:text-4xl">
            JobMatch AI ในตัวเลข
          </h2>
          <p class="mt-3 max-w-2xl mx-auto text-xl text-green-100 sm:mt-4">
            เราช่วยให้ผู้คนหลายพันคนพบงานที่ใช่ทุกวัน
          </p>
        </div>
        
        <dl class="grid grid-cols-1 gap-x-8 gap-y-10 sm:grid-cols-2 lg:grid-cols-4">
          <div v-for="stat in statistics" :key="stat.id" class="text-center">
            <dt class="order-2 mt-2 text-lg leading-6 font-medium text-green-100">
              {{ stat.label }}
            </dt>
            <dd class="order-1 text-5xl font-extrabold text-white">
              {{ stat.value }}
            </dd>
          </div>
        </dl>
      </div>
    </div>
  </div>
</template>