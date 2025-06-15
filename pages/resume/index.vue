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
          <div>
            <h1 class="text-3xl font-bold text-white">เรซูเม่ของฉัน</h1>
            <p class="text-green-200 mt-2">จัดการและแชร์เรซูเม่ของคุณ</p>
          </div>
          <NuxtLink to="/resume/builder" 
            class="bg-gradient-to-r from-green-400 to-yellow-400 hover:from-green-500 hover:to-yellow-500 text-green-900 font-bold py-3 px-6 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg flex items-center gap-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
            </svg>
            สร้างเรซูเม่ใหม่
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
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
            </div>
            <div class="ml-4">
              <p class="text-sm text-green-200">เรซูเม่ทั้งหมด</p>
              <p class="text-2xl font-bold text-white">{{ resumes.length }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl">
          <div class="flex items-center">
            <div class="p-3 bg-green-500/20 rounded-xl">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-green-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
              </svg>
            </div>
            <div class="ml-4">
              <p class="text-sm text-green-200">การดูทั้งหมด</p>
              <p class="text-2xl font-bold text-white">{{ totalViews }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl">
          <div class="flex items-center">
            <div class="p-3 bg-yellow-500/20 rounded-xl">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-yellow-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
              </svg>
            </div>
            <div class="ml-4">
              <p class="text-sm text-green-200">ถูกใจ</p>
              <p class="text-2xl font-bold text-white">{{ totalLikes }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl">
          <div class="flex items-center">
            <div class="p-3 bg-purple-500/20 rounded-xl">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-purple-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
            </div>
            <div class="ml-4">
              <p class="text-sm text-green-200">ดาวน์โหลด</p>
              <p class="text-2xl font-bold text-white">{{ totalDownloads }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Resume List -->
      <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
        <div class="flex items-center justify-between mb-6">
          <h2 class="text-2xl font-bold text-white">เรซูเม่ของคุณ</h2>
          <div class="flex gap-3">
            <select v-model="sortBy" class="px-4 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white text-sm">
              <option value="newest">ใหม่ล่าสุด</option>
              <option value="oldest">เก่าสุด</option>
              <option value="views">การดูมากสุด</option>
              <option value="name">ชื่อ A-Z</option>
            </select>
          </div>
        </div>

        <div v-if="resumes.length > 0" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div v-for="resume in sortedResumes" :key="resume.id" 
            class="bg-white/5 backdrop-blur-sm rounded-xl p-6 border border-white/10 hover:bg-white/10 transition-all duration-300 group">
            
            <!-- Resume Preview -->
            <div class="bg-white rounded-lg p-4 mb-4 min-h-[200px] relative overflow-hidden">
              <div class="text-xs text-gray-800">
                <div class="font-bold text-center border-b border-gray-300 pb-2 mb-2">
                  {{ resume.title }}
                </div>
                <div class="space-y-1 text-[10px]">
                  <div class="font-semibold">ข้อมูลส่วนตัว</div>
                  <div>{{ resume.name }}</div>
                  <div>{{ resume.email }}</div>
                  <div class="font-semibold mt-2">ประสบการณ์</div>
                  <div>{{ resume.experience }}</div>
                </div>
              </div>
              
              <!-- Overlay on hover -->
              <div class="absolute inset-0 bg-black/50 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center">
                <button @click="viewResume(resume.id)" 
                  class="bg-white text-gray-900 px-4 py-2 rounded-lg font-medium hover:bg-gray-100 transition-colors">
                  ดูเรซูเม่
                </button>
              </div>
            </div>

            <!-- Resume Info -->
            <div class="space-y-3">
              <div>
                <h3 class="font-bold text-white text-lg">{{ resume.title }}</h3>
                <p class="text-green-200 text-sm">{{ resume.description }}</p>
              </div>

              <!-- Stats -->
              <div class="flex items-center gap-4 text-sm text-green-100">
                <span class="flex items-center gap-1">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                  </svg>
                  {{ resume.views }}
                </span>
                <span class="flex items-center gap-1">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                  </svg>
                  {{ resume.downloads }}
                </span>
                <span :class="resume.isActive ? 'text-green-300' : 'text-yellow-300'" class="flex items-center gap-1">
                  <div :class="resume.isActive ? 'bg-green-400' : 'bg-yellow-400'" class="w-2 h-2 rounded-full"></div>
                  {{ resume.isActive ? 'เปิดใช้งาน' : 'ปิดใช้งาน' }}
                </span>
              </div>

              <!-- Actions -->
              <div class="flex gap-2 pt-2">
                <button @click="editResume(resume.id)" 
                  class="flex-1 bg-blue-500/20 hover:bg-blue-500/30 border border-blue-300/30 text-blue-200 px-3 py-2 rounded-lg text-sm transition-all duration-300">
                  แก้ไข
                </button>
                <button @click="shareResume(resume.id)" 
                  class="flex-1 bg-green-500/20 hover:bg-green-500/30 border border-green-300/30 text-green-200 px-3 py-2 rounded-lg text-sm transition-all duration-300">
                  แชร์
                </button>
                <button @click="downloadResume(resume.id)" 
                  class="bg-purple-500/20 hover:bg-purple-500/30 border border-purple-300/30 text-purple-200 px-3 py-2 rounded-lg text-sm transition-all duration-300">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                  </svg>
                </button>
              </div>

              <!-- Created Date -->
              <p class="text-xs text-green-300">สร้างเมื่อ: {{ formatDate(resume.createdAt) }}</p>
            </div>
          </div>
        </div>

        <!-- Empty State -->
        <div v-else class="text-center py-12">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-green-300 mx-auto mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
          <p class="text-green-200 text-lg">ยังไม่มีเรซูเม่</p>
          <p class="text-green-300 text-sm mb-4">เริ่มสร้างเรซูเม่แรกของคุณ</p>
          <NuxtLink to="/resume/builder" 
            class="inline-flex items-center gap-2 bg-gradient-to-r from-green-400 to-yellow-400 hover:from-green-500 hover:to-yellow-500 text-green-900 font-bold py-3 px-6 rounded-xl transition-all duration-300 transform hover:scale-105">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
            </svg>
            สร้างเรซูเม่
          </NuxtLink>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'

// Sample resume data
const resumes = ref([
  {
    id: '1',
    title: 'เรซูเม่ Frontend Developer',
    description: 'เรซูเม่สำหรับสมัครงาน Frontend Developer',
    name: 'สมชาย ใจดี',
    email: 'somchai@example.com',
    experience: 'Frontend Developer ที่ ABC Company',
    views: 156,
    downloads: 23,
    likes: 12,
    isActive: true,
    createdAt: '2024-06-10',
    lastModified: '2024-06-12'
  },
  {
    id: '2',
    title: 'เรซูเม่ Full Stack Developer',
    description: 'เรซูเม่สำหรับสมัครงาน Full Stack Developer',
    name: 'สมชาย ใจดี',
    email: 'somchai@example.com',
    experience: 'Full Stack Developer ที่ XYZ Company',
    views: 89,
    downloads: 15,
    likes: 8,
    isActive: false,
    createdAt: '2024-06-05',
    lastModified: '2024-06-08'
  }
])

// Sorting
const sortBy = ref('newest')

// Computed
const sortedResumes = computed(() => {
  const sorted = [...resumes.value]
  
  switch (sortBy.value) {
    case 'newest':
      return sorted.sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime())
    case 'oldest':
      return sorted.sort((a, b) => new Date(a.createdAt).getTime() - new Date(b.createdAt).getTime())
    case 'views':
      return sorted.sort((a, b) => b.views - a.views)
    case 'name':
      return sorted.sort((a, b) => a.title.localeCompare(b.title))
    default:
      return sorted
  }
})

const totalViews = computed(() => resumes.value.reduce((sum, resume) => sum + resume.views, 0))
const totalDownloads = computed(() => resumes.value.reduce((sum, resume) => sum + resume.downloads, 0))
const totalLikes = computed(() => resumes.value.reduce((sum, resume) => sum + resume.likes, 0))

// Functions
const formatDate = (dateString: string) => {
  const date = new Date(dateString)
  return date.toLocaleDateString('th-TH')
}

const viewResume = (resumeId: string) => {
  navigateTo(`/resume/view/${resumeId}`)
}

const editResume = (resumeId: string) => {
  console.log('Edit resume:', resumeId)
  navigateTo(`/resume/builder?edit=${resumeId}`)
}

const shareResume = (resumeId: string) => {
  console.log('Share resume:', resumeId)
  // Copy share link to clipboard
  const shareUrl = `${window.location.origin}/resume/view/${resumeId}`
  navigator.clipboard.writeText(shareUrl).then(() => {
    alert('ลิงก์แชร์ถูกคัดลอกแล้ว!')
  })
}

const downloadResume = (resumeId: string) => {
  console.log('Download resume:', resumeId)
  alert('ดาวน์โหลดเรซูเม่เป็น PDF')
}
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
