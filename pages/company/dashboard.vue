<template>
  <div class="min-h-screen bg-gradient-to-br from-green-500 via-blue-600 to-yellow-500 relative overflow-hidden">
    <!-- Animated Background -->
    <div class="absolute inset-0">
      <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-green-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob"></div>
      <div class="absolute top-1/3 right-1/4 w-80 h-80 bg-blue-300 rounded-full mix-blend-multiply filter blur-3xl opacity-25 animate-blob animation-delay-2000"></div>
      <div class="absolute bottom-1/4 left-1/3 w-72 h-72 bg-purple-400 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-4000"></div>
    </div>

    <!-- Header -->
    <div class="relative z-10 bg-white/10 backdrop-blur-md border-b border-white/20">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <div class="flex items-center justify-between">
          <h1 class="text-3xl font-bold text-white">แดชบอร์ดบริษัท</h1>
          <NuxtLink to="/company/post-job" 
            class="bg-gradient-to-r from-green-400 to-yellow-400 hover:from-green-500 hover:to-yellow-500 text-green-900 font-bold py-3 px-6 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg flex items-center gap-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
            </svg>
            ลงประกาศงานใหม่
          </NuxtLink>
        </div>
      </div>
    </div>
    
    <!-- Content -->
    <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Stats Cards -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl">
          <div class="flex items-center">
            <div class="p-3 bg-blue-500/20 rounded-xl">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-blue-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2-2v2m8 0V6a2 2 0 012 2v6a2 2 0 01-2 2H6a2 2 0 01-2-2V8a2 2 0 012-2V6" />
              </svg>
            </div>
            <div class="ml-4">
              <p class="text-sm text-green-200">งานที่ลงทั้งหมด</p>
              <p class="text-2xl font-bold text-white">{{ stats.totalJobs }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl">
          <div class="flex items-center">
            <div class="p-3 bg-green-500/20 rounded-xl">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-green-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
              </svg>
            </div>
            <div class="ml-4">
              <p class="text-sm text-green-200">ผู้สมัครทั้งหมด</p>
              <p class="text-2xl font-bold text-white">{{ stats.totalApplicants }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl">
          <div class="flex items-center">
            <div class="p-3 bg-yellow-500/20 rounded-xl">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-yellow-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
              </svg>
            </div>
            <div class="ml-4">
              <p class="text-sm text-green-200">การดูงาน</p>
              <p class="text-2xl font-bold text-white">{{ stats.totalViews }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl">
          <div class="flex items-center">
            <div class="p-3 bg-purple-500/20 rounded-xl">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-purple-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            </div>
            <div class="ml-4">
              <p class="text-sm text-green-200">งานที่เปิดอยู่</p>
              <p class="text-2xl font-bold text-white">{{ stats.activeJobs }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Jobs List -->
      <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
        <div class="flex items-center justify-between mb-6">
          <h2 class="text-2xl font-bold text-white">งานที่ลงไว้</h2>
          <div class="flex gap-3">
            <select v-model="filterStatus" class="px-4 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white text-sm">
              <option value="all">ทั้งหมด</option>
              <option value="active">เปิดรับสมัคร</option>
              <option value="closed">ปิดรับสมัคร</option>
              <option value="draft">แบบร่าง</option>
            </select>
          </div>
        </div>

        <div class="space-y-4">
          <div v-for="job in filteredJobs" :key="job.id" 
            class="bg-white/5 backdrop-blur-sm rounded-xl p-6 border border-white/10 hover:bg-white/10 transition-all duration-300">
            <div class="flex items-start justify-between">
              <div class="flex-1">
                <div class="flex items-center gap-3 mb-2">
                  <h3 class="text-lg font-bold text-white">{{ job.title }}</h3>
                  <span :class="getStatusClass(job.status)" class="px-3 py-1 rounded-full text-xs font-medium">
                    {{ getStatusText(job.status) }}
                  </span>
                  <span v-if="job.isUrgent" class="bg-red-500/20 border border-red-300/30 text-red-200 px-2 py-1 rounded-full text-xs">
                    เร่งด่วน
                  </span>
                </div>
                
                <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-3 text-sm">
                  <div class="text-green-100">
                    <span class="text-white font-medium">ประเภท:</span> {{ job.type }}
                  </div>
                  <div class="text-green-100">
                    <span class="text-white font-medium">สถานที่:</span> {{ job.location }}
                  </div>
                  <div class="text-green-100">
                    <span class="text-white font-medium">ผู้สมัคร:</span> {{ job.applicants }} คน
                  </div>
                  <div class="text-green-100">
                    <span class="text-white font-medium">การดู:</span> {{ job.views }} ครั้ง
                  </div>
                </div>
                
                <p class="text-green-100 text-sm mb-3">{{ job.description.substring(0, 150) }}...</p>
                
                <div class="flex items-center gap-4 text-xs text-green-200">
                  <span>ลงเมื่อ: {{ formatDate(job.postedDate) }}</span>
                  <span>ปิดรับ: {{ formatDate(job.deadline) }}</span>
                </div>
              </div>
              
              <div class="flex flex-col gap-2 ml-4">
                <button @click="editJob(job.id)" 
                  class="bg-blue-500/20 hover:bg-blue-500/30 border border-blue-300/30 text-blue-200 px-4 py-2 rounded-lg text-sm transition-all duration-300">
                  แก้ไข
                </button>
                <button @click="viewApplicants(job.id)" 
                  class="bg-green-500/20 hover:bg-green-500/30 border border-green-300/30 text-green-200 px-4 py-2 rounded-lg text-sm transition-all duration-300">
                  ดูผู้สมัคร
                </button>
                <button @click="toggleJobStatus(job.id)" 
                  :class="job.status === 'active' ? 'bg-red-500/20 hover:bg-red-500/30 border-red-300/30 text-red-200' : 'bg-green-500/20 hover:bg-green-500/30 border-green-300/30 text-green-200'"
                  class="border px-4 py-2 rounded-lg text-sm transition-all duration-300">
                  {{ job.status === 'active' ? 'ปิดรับสมัคร' : 'เปิดรับสมัคร' }}
                </button>
              </div>
            </div>
          </div>
        </div>

        <div v-if="filteredJobs.length === 0" class="text-center py-12">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-green-300 mx-auto mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2-2v2m8 0V6a2 2 0 012 2v6a2 2 0 01-2 2H6a2 2 0 01-2-2V8a2 2 0 012-2V6" />
          </svg>
          <p class="text-green-200 text-lg">ยังไม่มีงานที่ลงไว้</p>
          <p class="text-green-300 text-sm mb-4">เริ่มต้นลงประกาศงานแรกของคุณ</p>
          <NuxtLink to="/company/post-job" 
            class="inline-flex items-center gap-2 bg-gradient-to-r from-green-400 to-yellow-400 hover:from-green-500 hover:to-yellow-500 text-green-900 font-bold py-3 px-6 rounded-xl transition-all duration-300 transform hover:scale-105">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
            </svg>
            ลงประกาศงาน
          </NuxtLink>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { navigateTo } from '#app'

// ข้อมูลสถิติ
const stats = ref({
  totalJobs: 12,
  totalApplicants: 156,
  totalViews: 2340,
  activeJobs: 8
})

// ตัวกรองสถานะ
const filterStatus = ref('all')

// ข้อมูลงาน (จำลอง)
const jobs = ref([
  {
    id: '1',
    title: 'Frontend Developer',
    type: 'งานประจำ',
    location: 'กรุงเทพฯ',
    description: 'รับสมัครนักพัฒนาเว็บไซต์ Frontend ที่มีประสบการณ์ในการใช้ Vue.js และ React',
    applicants: 24,
    views: 340,
    status: 'active',
    isUrgent: true,
    postedDate: '2024-06-10',
    deadline: '2024-06-30'
  },
  {
    id: '2',
    title: 'Backend Developer',
    type: 'งานประจำ',
    location: 'นนทบุรี',
    description: 'รับสมัครนักพัฒนาระบบ Backend ที่มีความเชี่ยวชาญใน Node.js และ Python',
    applicants: 18,
    views: 280,
    status: 'active',
    isUrgent: false,
    postedDate: '2024-06-08',
    deadline: '2024-06-25'
  },
  {
    id: '3',
    title: 'UI/UX Designer',
    type: 'งานสัญญาจ้าง',
    location: 'Remote',
    description: 'รับสมัครนักออกแบบ UI/UX ที่มีประสบการณ์ในการออกแบบแอปพลิเคชันมือถือ',
    applicants: 32,
    views: 420,
    status: 'closed',
    isUrgent: false,
    postedDate: '2024-06-05',
    deadline: '2024-06-20'
  }
])

// งานที่กรองแล้ว
const filteredJobs = computed(() => {
  if (filterStatus.value === 'all') {
    return jobs.value
  }
  return jobs.value.filter(job => job.status === filterStatus.value)
})

// ฟังก์ชันช่วย
const getStatusClass = (status: string) => {
  switch (status) {
    case 'active':
      return 'bg-green-500/20 border border-green-300/30 text-green-200'
    case 'closed':
      return 'bg-red-500/20 border border-red-300/30 text-red-200'
    case 'draft':
      return 'bg-yellow-500/20 border border-yellow-300/30 text-yellow-200'
    default:
      return 'bg-gray-500/20 border border-gray-300/30 text-gray-200'
  }
}

const getStatusText = (status: string) => {
  switch (status) {
    case 'active':
      return 'เปิดรับสมัคร'
    case 'closed':
      return 'ปิดรับสมัคร'
    case 'draft':
      return 'แบบร่าง'
    default:
      return 'ไม่ทราบสถานะ'
  }
}

const formatDate = (dateString: string) => {
  const date = new Date(dateString)
  return date.toLocaleDateString('th-TH')
}

// ฟังก์ชันการจัดการ
const editJob = (jobId: string) => {
  // นำทางไปยังหน้าแก้ไขงาน
  console.log('Edit job:', jobId)
}

const viewApplicants = (jobId: string) => {
  // นำทางไปยังหน้าดูผู้สมัคร
  navigateTo(`/company/applicants?jobId=${jobId}`)
}

const toggleJobStatus = (jobId: string) => {
  const job = jobs.value.find(j => j.id === jobId)
  if (job) {
    job.status = job.status === 'active' ? 'closed' : 'active'
    // อัพเดทสถิติ
    stats.value.activeJobs = jobs.value.filter(j => j.status === 'active').length
  }
}

onMounted(() => {
  // โหลดข้อมูลเมื่อคอมโพเนนต์ถูกโหลด
  console.log('Company dashboard loaded')
})
</script>

<style scoped>
@keyframes blob {
  0% { transform: translate(0px, 0px) scale(1); }
  33% { transform: translate(30px, -50px) scale(1.1); }
  66% { transform: translate(-20px, 20px) scale(0.9); }
  100% { transform: translate(0px, 0px) scale(1); }
}

.animate-blob {
  animation: blob 7s infinite;
}

.animation-delay-2000 { animation-delay: 2s; }
.animation-delay-4000 { animation-delay: 4s; }

.backdrop-blur-md {
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
}

.backdrop-blur-sm {
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
}

select option {
  background-color: #1f2937;
  color: white;
}
</style>
