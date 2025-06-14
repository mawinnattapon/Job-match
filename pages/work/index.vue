<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Hero Section with Animated Background -->
    <div class="relative overflow-hidden bg-gradient-to-br from-green-600 via-green-700 to-emerald-900">
      <!-- Animated Background Elements -->
      <div class="absolute inset-0">
        <!-- Grid Pattern -->
        <div class="absolute inset-0 bg-grid-pattern opacity-10"></div>
        
        <!-- Floating Blobs -->
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

      <!-- Header Content -->
      <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <!-- Hero Section -->
        <div class="relative z-10 text-center mb-16">
          <!-- Premium Badge -->
          <div class="inline-flex items-center gap-2 bg-gradient-to-r from-yellow-400/20 to-orange-500/20 backdrop-blur-sm border border-yellow-400/30 rounded-full px-4 py-2 mb-6">
            <div class="w-2 h-2 bg-gradient-to-r from-yellow-400 to-orange-500 rounded-full animate-pulse"></div>
            <span class="text-yellow-200 text-sm font-medium">AI-Powered Job Matching</span>
          </div>

          <!-- Main Title -->
          <h1 class="text-5xl md:text-7xl font-bold mb-6">
            <span class="bg-gradient-to-r from-green-400 via-blue-500 to-yellow-400 bg-clip-text text-transparent animate-gradient">
              ค้นหางานที่ใช่
            </span>
            <br>
            <span class="text-white">สำหรับคุณ</span>
          </h1>

          <!-- Subtitle -->
          <div class="max-w-2xl mx-auto">
            <p class="text-xl md:text-2xl text-green-100 leading-relaxed">
              ระบบจับคู่งานอัจฉริยะ
              <br>
              ที่จะช่วยคุณค้นหาโอกาสใหม่ ๆ
              <br>
              <span class="text-green-200">พร้อมฟิลเตอร์และการจัดเรียงที่ทันสมัย</span>
            </p>
          </div>
        </div>

        <!-- Search Section -->
        <div class="max-w-4xl mx-auto">
          <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
            <div class="grid grid-cols-1 md:grid-cols-12 gap-4">
              <!-- Search Input -->
              <div class="md:col-span-6">
                <div class="relative">
                  <input
                    v-model="searchQuery"
                    type="text"
                    placeholder="ค้นหาตำแหน่งงาน, บริษัท, หรือทักษะ..."
                    class="w-full px-4 py-4 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-yellow-400 focus:border-transparent transition-all duration-300"
                  />
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 absolute right-4 top-1/2 transform -translate-y-1/2 text-green-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                  </svg>
                </div>
              </div>

              <!-- Location Filter -->
              <div class="md:col-span-3">
                <select
                  v-model="selectedLocation"
                  class="w-full px-4 py-4 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-yellow-400 focus:border-transparent transition-all duration-300"
                >
                  <option value="all" class="text-gray-800">ทุกสถานที่</option>
                  <option value="bangkok" class="text-gray-800">กรุงเทพฯ</option>
                  <option value="chiangmai" class="text-gray-800">เชียงใหม่</option>
                  <option value="phuket" class="text-gray-800">ภูเก็ต</option>
                  <option value="remote" class="text-gray-800">ทำงานจากบ้าน</option>
                </select>
              </div>

              <!-- Search Button -->
              <div class="md:col-span-3">
                <button
                  @click="searchJobs"
                  :disabled="isLoading"
                  class="w-full bg-gradient-to-r from-yellow-400 to-orange-500 hover:from-yellow-500 hover:to-orange-600 disabled:from-gray-400 disabled:to-gray-500 text-white font-bold py-4 px-6 rounded-xl shadow-lg hover:shadow-xl transform hover:scale-105 disabled:transform-none transition-all duration-300 flex items-center justify-center"
                >
                  <svg v-if="isLoading" class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  <span v-if="!isLoading">ค้นหา</span>
                  <span v-else>กำลังค้นหา...</span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Job Statistics Section -->
    <div class="py-16 bg-white">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12">
          <div class="inline-flex items-center px-4 py-2 rounded-full bg-gradient-to-r from-green-100 to-emerald-100 text-green-800 text-sm font-medium mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
            </svg>
            สถิติงานล่าสุด
          </div>
          <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            โอกาสการทำงาน
            <span class="bg-gradient-to-r from-green-600 to-emerald-600 bg-clip-text text-transparent">ที่รอคุณอยู่</span>
          </h2>
        </div>

        <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
          <div class="group">
            <div class="relative bg-gradient-to-br from-green-50 to-emerald-50 rounded-2xl p-6 border border-green-100 hover:border-green-200 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
              <div class="absolute -inset-1 bg-gradient-to-r from-green-400 to-emerald-400 rounded-2xl opacity-0 group-hover:opacity-20 transition-opacity duration-300"></div>
              <div class="relative">
                <div class="w-12 h-12 bg-gradient-to-br from-green-500 to-emerald-600 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform duration-300">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.1c-.1 0-.3.1-.4.2l-1 1 2.1 2.1c.2.2.2.6 0 .8l-1 1c-.2.2-.6.2-.8 0l-2.1-2.1-1 1c-.2.2-.6.2-.8 0L15.1 16c-.1-.1-.2-.3-.2-.4 0-.1 0-.3.1-.4l3-3c.1-.1.3-.1.4-.1s.3 0 .4.1l3 3c.1.1.1.3.1.4zM12 2C6.5 2 2 6.5 2 12s4.5 10 10 10c.9 0 1.8-.1 2.6-.3l-.3-.3-1.1-1.1c-.4.2-.8.2-1.2.2-4.4 0-8-3.6-8-8s3.6-8 8-8 8 3.6 8 8c0 .4-.1.8-.2 1.2l1.1 1.1.3.3c.2-.8.3-1.7.3-2.6 0-5.5-4.5-10-10-10z"/>
                  </svg>
                </div>
                <div class="text-2xl font-bold text-gray-900 mb-1">{{ totalJobs.toLocaleString() }}</div>
                <div class="text-green-600 font-medium">งานทั้งหมด</div>
              </div>
            </div>
          </div>

          <div class="group">
            <div class="relative bg-gradient-to-br from-blue-50 to-cyan-50 rounded-2xl p-6 border border-blue-100 hover:border-blue-200 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
              <div class="absolute -inset-1 bg-gradient-to-r from-blue-400 to-cyan-400 rounded-2xl opacity-0 group-hover:opacity-20 transition-opacity duration-300"></div>
              <div class="relative">
                <div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-cyan-600 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform duration-300">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                </div>
                <div class="text-2xl font-bold text-gray-900 mb-1">{{ remoteJobs.toLocaleString() }}</div>
                <div class="text-blue-600 font-medium">งาน Remote</div>
              </div>
            </div>
          </div>

          <div class="group">
            <div class="relative bg-gradient-to-br from-orange-50 to-red-50 rounded-2xl p-6 border border-orange-100 hover:border-orange-200 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
              <div class="absolute -inset-1 bg-gradient-to-r from-orange-400 to-red-400 rounded-2xl opacity-0 group-hover:opacity-20 transition-opacity duration-300"></div>
              <div class="relative">
                <div class="w-12 h-12 bg-gradient-to-br from-orange-500 to-red-600 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform duration-300">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                </div>
                <div class="text-2xl font-bold text-gray-900 mb-1">{{ urgentJobs.toLocaleString() }}</div>
                <div class="text-orange-600 font-medium">งานด่วน</div>
              </div>
            </div>
          </div>

          <div class="group">
            <div class="relative bg-gradient-to-br from-yellow-50 to-amber-50 rounded-2xl p-6 border border-yellow-100 hover:border-yellow-200 transition-all duration-300 transform hover:scale-105 hover:shadow-lg">
              <div class="absolute -inset-1 bg-gradient-to-r from-yellow-400 to-amber-400 rounded-2xl opacity-0 group-hover:opacity-20 transition-opacity duration-300"></div>
              <div class="relative">
                <div class="w-12 h-12 bg-gradient-to-br from-yellow-500 to-amber-600 rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform duration-300">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1" />
                  </svg>
                </div>
                <div class="text-2xl font-bold text-gray-900 mb-1">{{ highSalaryJobs.toLocaleString() }}</div>
                <div class="text-yellow-600 font-medium">เงินเดือนสูง</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Job Listings Section -->
    <div class="py-16 bg-gray-50">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <!-- Section Header -->
        <div class="flex flex-col md:flex-row md:items-center md:justify-between mb-8">
          <div>
            <h2 class="text-3xl font-bold text-gray-900 mb-2">
              ตำแหน่งงานที่
              <span class="bg-gradient-to-r from-green-600 to-emerald-600 bg-clip-text text-transparent">แนะนำ</span>
            </h2>
            <p class="text-gray-600">พบ {{ filteredJobs.length }} ตำแหน่งงานที่เหมาะกับคุณ</p>
          </div>
          
          <!-- Sort Options -->
          <div class="mt-4 md:mt-0">
            <select
              v-model="sortBy"
              class="px-4 py-2 bg-white border border-gray-300 rounded-lg text-gray-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent"
            >
              <option value="match">เรียงตามความเหมาะสม</option>
              <option value="date">เรียงตามวันที่โพสต์</option>
              <option value="salary">เรียงตามเงินเดือน</option>
              <option value="company">เรียงตามชื่อบริษัท</option>
            </select>
          </div>
        </div>

        <!-- Job Cards Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div
            v-for="job in filteredJobs"
            :key="job.id"
            class="group bg-white rounded-2xl shadow-sm hover:shadow-xl border border-gray-100 hover:border-green-200 transition-all duration-300 transform hover:scale-105 overflow-hidden"
          >
            <!-- Job Card Content -->
            <div class="p-6">
              <!-- Company Logo & Match Score -->
              <div class="flex items-start justify-between mb-4">
                <div class="flex items-center">
                  <div class="w-12 h-12 bg-gradient-to-br from-green-100 to-emerald-100 rounded-xl flex items-center justify-center mr-3">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                    </svg>
                  </div>
                  <div>
                    <div class="font-semibold text-gray-900 text-sm">{{ job.company }}</div>
                    <div class="text-gray-500 text-xs">{{ job.location }}</div>
                  </div>
                </div>
                
                <!-- Match Score -->
                <div class="flex items-center space-x-2">
                  <div class="px-2 py-1 bg-gradient-to-r from-green-100 to-emerald-100 text-green-700 text-xs font-medium rounded-full">
                    {{ job.match }}% Match
                  </div>
                  <button
                    @click="toggleFavorite(job.id)"
                    class="p-1 rounded-full hover:bg-gray-100 transition-colors duration-200"
                  >
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" :class="job.isFavorite ? 'text-red-500 fill-current' : 'text-gray-400'" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                    </svg>
                  </button>
                </div>
              </div>

              <!-- Job Title -->
              <h3 class="text-lg font-bold text-gray-900 mb-2 group-hover:text-green-600 transition-colors duration-200 line-clamp-2">
                {{ job.title }}
              </h3>

              <!-- Salary & Type -->
              <div class="flex items-center justify-between mb-4">
                <div class="text-green-600 font-semibold">{{ job.salary }}</div>
                <div class="px-2 py-1 bg-blue-100 text-blue-700 text-xs font-medium rounded-full">
                  {{ job.type }}
                </div>
              </div>

              <!-- Tags -->
              <div class="flex flex-wrap gap-2 mb-4">
                <span
                  v-for="tag in job.tags.slice(0, 3)"
                  :key="tag"
                  class="px-2 py-1 bg-gray-100 text-gray-600 text-xs rounded-full"
                >
                  {{ tag }}
                </span>
                <span v-if="job.tags.length > 3" class="px-2 py-1 bg-gray-100 text-gray-500 text-xs rounded-full">
                  +{{ job.tags.length - 3 }}
                </span>
              </div>

              <!-- Posted Date -->
              <div class="text-gray-500 text-sm mb-4">{{ job.posted }}</div>

              <!-- Action Buttons -->
              <div class="flex space-x-2">
                <button
                  @click="viewDetails(job.id)"
                  class="flex-1 bg-gradient-to-r from-green-500 to-emerald-600 hover:from-green-600 hover:to-emerald-700 text-white font-medium py-2 px-4 rounded-lg transition-all duration-200 transform hover:scale-105"
                >
                  ดูรายละเอียด
                </button>
                <button
                  @click="applyJob(job.id)"
                  class="flex-1 bg-gradient-to-r from-yellow-400 to-orange-500 hover:from-yellow-500 hover:to-orange-600 text-white font-medium py-2 px-4 rounded-lg transition-all duration-200 transform hover:scale-105"
                >
                  สมัครงาน
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Load More Button -->
        <div class="text-center mt-12">
          <button class="bg-gradient-to-r from-green-500 to-emerald-600 hover:from-green-600 hover:to-emerald-700 text-white font-bold py-3 px-8 rounded-xl shadow-lg hover:shadow-xl transform hover:scale-105 transition-all duration-300">
            โหลดงานเพิ่มเติม
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'

// Search state
const searchQuery = ref('')
const selectedLocation = ref('all')
const sortBy = ref('match')
const isLoading = ref(false)

// Sample job data
const jobs = ref([
  {
    id: 1,
    title: 'Frontend Developer',
    company: 'TechCorp Thailand',
    location: 'กรุงเทพฯ',
    salary: '50,000 - 80,000 บาท',
    salaryMax: 80000,
    posted: '2 วันที่แล้ว',
    postedTimestamp: Date.now() - 2 * 24 * 60 * 60 * 1000,
    description: 'พัฒนาเว็บแอปพลิเคชันด้วย React และ TypeScript ร่วมงานกับทีมดีไซน์และแบ็กเอนด์',
    tags: ['React', 'TypeScript', 'CSS', 'JavaScript'],
    isFavorite: false,
    isUrgent: false,
    type: 'Full-time',
    match: 85
  },
  {
    id: 2,
    title: 'UX/UI Designer',
    company: 'Creative Studio',
    location: 'เชียงใหม่',
    salary: '40,000 - 60,000 บาท',
    salaryMax: 60000,
    posted: '1 วันที่แล้ว',
    postedTimestamp: Date.now() - 1 * 24 * 60 * 60 * 1000,
    description: 'ออกแบบ User Interface และ User Experience สำหรับแอปพลิเคชันมือถือและเว็บไซต์',
    tags: ['Figma', 'Adobe XD', 'Sketch', 'Prototyping'],
    isFavorite: false,
    isUrgent: true,
    type: 'Remote',
    match: 78
  },
  {
    id: 3,
    title: 'Digital Marketing Manager',
    company: 'Growth Agency',
    location: 'กรุงเทพฯ',
    salary: '60,000 - 90,000 บาท',
    salaryMax: 90000,
    posted: '3 วันที่แล้ว',
    postedTimestamp: Date.now() - 3 * 24 * 60 * 60 * 1000,
    description: 'วางแผนและดำเนินกลยุทธ์การตลาดดิจิทัล บริหารงบโฆษณาออนไลน์',
    tags: ['Google Ads', 'Facebook Ads', 'SEO', 'Analytics'],
    isFavorite: true,
    isUrgent: false,
    type: 'Hybrid',
    match: 92
  },
  {
    id: 4,
    title: 'Data Scientist',
    company: 'AI Solutions',
    location: 'ทำงานจากบ้าน',
    salary: '70,000 - 120,000 บาท',
    salaryMax: 120000,
    posted: '1 วันที่แล้ว',
    postedTimestamp: Date.now() - 1 * 24 * 60 * 60 * 1000,
    description: 'วิเคราะห์ข้อมูลขนาดใหญ่ สร้างโมเดล Machine Learning และ AI',
    tags: ['Python', 'SQL', 'Machine Learning', 'TensorFlow'],
    isFavorite: false,
    isUrgent: true,
    type: 'Remote',
    match: 88
  },
  {
    id: 5,
    title: 'Product Manager',
    company: 'Startup Hub',
    location: 'กรุงเทพฯ',
    salary: '80,000 - 150,000 บาท',
    salaryMax: 150000,
    posted: '4 วันที่แล้ว',
    postedTimestamp: Date.now() - 4 * 24 * 60 * 60 * 1000,
    description: 'บริหารผลิตภัณฑ์ตั้งแต่แนวคิดจนถึงการเปิดตัว ทำงานร่วมกับทีมข้ามสายงาน',
    tags: ['Product Strategy', 'Agile', 'User Research', 'Analytics'],
    isFavorite: false,
    isUrgent: false,
    type: 'Hybrid',
    match: 95
  },
  {
    id: 6,
    title: 'Backend Developer',
    company: 'Cloud Systems',
    location: 'ภูเก็ต',
    salary: '55,000 - 85,000 บาท',
    salaryMax: 85000,
    posted: '2 วันที่แล้ว',
    postedTimestamp: Date.now() - 2 * 24 * 60 * 60 * 1000,
    description: 'พัฒนา API และระบบแบ็กเอนด์สำหรับแพลตฟอร์มอีคอมเมิร์ซ',
    tags: ['Node.js', 'MongoDB', 'Express', 'AWS'],
    isFavorite: true,
    isUrgent: false,
    type: 'Full-time',
    match: 82
  },
  {
    id: 7,
    title: 'DevOps Engineer',
    company: 'Tech Innovate',
    location: 'กรุงเทพฯ',
    salary: '75,000 - 110,000 บาท',
    salaryMax: 110000,
    posted: '1 วันที่แล้ว',
    postedTimestamp: Date.now() - 1 * 24 * 60 * 60 * 1000,
    description: 'จัดการโครงสร้างพื้นฐาน Cloud และ CI/CD Pipeline',
    tags: ['AWS', 'Docker', 'Kubernetes', 'Jenkins'],
    isFavorite: false,
    isUrgent: true,
    type: 'Full-time',
    match: 87
  },
  {
    id: 8,
    title: 'Mobile App Developer',
    company: 'Mobile First',
    location: 'ทำงานจากบ้าน',
    salary: '60,000 - 95,000 บาท',
    salaryMax: 95000,
    posted: '3 วันที่แล้ว',
    postedTimestamp: Date.now() - 3 * 24 * 60 * 60 * 1000,
    description: 'พัฒนาแอปพลิเคชันมือถือด้วย React Native และ Flutter',
    tags: ['React Native', 'Flutter', 'iOS', 'Android'],
    isFavorite: false,
    isUrgent: false,
    type: 'Remote',
    match: 80
  }
])

// Computed properties
const filteredJobs = computed(() => {
  let filtered = jobs.value

  // Filter by search query
  if (searchQuery.value) {
    const query = searchQuery.value.toLowerCase()
    filtered = filtered.filter(job =>
      job.title.toLowerCase().includes(query) ||
      job.company.toLowerCase().includes(query) ||
      job.description.toLowerCase().includes(query) ||
      job.tags.some(tag => tag.toLowerCase().includes(query))
    )
  }

  // Filter by location
  if (selectedLocation.value && selectedLocation.value !== 'all') {
    filtered = filtered.filter(job => {
      if (selectedLocation.value === 'remote') {
        return job.location.includes('ทำงานจากบ้าน') || job.type === 'Remote'
      } else if (selectedLocation.value === 'bangkok') {
        return job.location.includes('กรุงเทพฯ')
      } else if (selectedLocation.value === 'chiangmai') {
        return job.location.includes('เชียงใหม่')
      } else if (selectedLocation.value === 'phuket') {
        return job.location.includes('ภูเก็ต')
      }
      return true
    })
  }

  // Sort
  if (sortBy.value === 'match') {
    filtered.sort((a, b) => b.match - a.match)
  } else if (sortBy.value === 'date') {
    filtered.sort((a, b) => b.postedTimestamp - a.postedTimestamp)
  } else if (sortBy.value === 'salary') {
    filtered.sort((a, b) => b.salaryMax - a.salaryMax)
  } else if (sortBy.value === 'company') {
    filtered.sort((a, b) => a.company.localeCompare(b.company))
  }

  return filtered
})

const totalJobs = computed(() => jobs.value.length)
const remoteJobs = computed(() => jobs.value.filter(job => job.type === 'Remote' || job.location.includes('ทำงานจากบ้าน')).length)
const urgentJobs = computed(() => jobs.value.filter(job => job.isUrgent).length)
const highSalaryJobs = computed(() => jobs.value.filter(job => job.salaryMax >= 100000).length)

// Methods
const searchJobs = () => {
  isLoading.value = true
  setTimeout(() => {
    isLoading.value = false
    console.log('Search completed')
  }, 1000)
}

const toggleFavorite = (jobId: number) => {
  const job = jobs.value.find(j => j.id === jobId)
  if (job) {
    job.isFavorite = !job.isFavorite
  }
}

const viewDetails = (jobId: number) => {
  navigateTo(`/work/details?id=${jobId}`)
}

const applyJob = (jobId: number) => {
  navigateTo(`/work/apply?id=${jobId}`)
}
</script>

<style scoped>
/* Animation Keyframes */
@keyframes blob {
  0% {
    transform: translate(0px, 0px) scale(1);
  }
  33% {
    transform: translate(30px, -50px) scale(1.1);
  }
  66% {
    transform: translate(-20px, 20px) scale(0.9);
  }
  100% {
    transform: translate(0px, 0px) scale(1);
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes gradient-x {
  0%, 100% {
    background-size: 200% 200%;
    background-position: left center;
  }
  50% {
    background-size: 200% 200%;
    background-position: right center;
  }
}

/* Animation Classes */
.animate-blob {
  animation: blob 7s infinite;
}

.animate-fadeIn {
  animation: fadeIn 0.6s ease-out;
}

.animate-gradient-x {
  animation: gradient-x 3s ease infinite;
}

/* Animation Delays */
.animation-delay-300 {
  animation-delay: 300ms;
}

.animation-delay-500 {
  animation-delay: 500ms;
}

.animation-delay-600 {
  animation-delay: 600ms;
}

.animation-delay-800 {
  animation-delay: 800ms;
}

.animation-delay-1000 {
  animation-delay: 1000ms;
}

.animation-delay-2000 {
  animation-delay: 2000ms;
}

.animation-delay-4000 {
  animation-delay: 4000ms;
}

.animation-delay-6000 {
  animation-delay: 6000ms;
}

/* Grid Pattern */
.bg-grid-pattern {
  background-image: 
    linear-gradient(rgba(255, 255, 255, 0.1) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.1) 1px, transparent 1px);
  background-size: 20px 20px;
}

/* Line Clamp */
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>