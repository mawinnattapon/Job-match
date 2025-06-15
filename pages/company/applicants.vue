<template>
  <div class="min-h-screen bg-gradient-to-br from-green-500 via-blue-600 to-yellow-500 relative overflow-hidden">
    <!-- Animated Background -->
    <div class="absolute inset-0">
      <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-green-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob"></div>
      <div class="absolute top-1/3 right-1/4 w-80 h-80 bg-blue-300 rounded-full mix-blend-multiply filter blur-3xl opacity-25 animate-blob animation-delay-2000"></div>
    </div>

    <!-- Header -->
    <div class="relative z-10 bg-white/10 backdrop-blur-md border-b border-white/20">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <div class="flex items-center justify-between">
          <div class="flex items-center gap-4">
            <button @click="$router.back()" class="text-white hover:text-green-200 transition-colors">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
              </svg>
            </button>
            <div>
              <h1 class="text-3xl font-bold text-white">ผู้สมัครงาน</h1>
              <p class="text-green-200">{{ selectedJob?.title || 'Frontend Developer' }}</p>
            </div>
          </div>
          <div class="flex items-center gap-3">
            <span class="bg-green-500/20 backdrop-blur-sm border border-green-300/30 text-green-200 px-4 py-2 rounded-xl font-medium">
              {{ applicants.length }} ผู้สมัคร
            </span>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Filters -->
    <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
      <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl mb-6">
        <div class="flex flex-wrap items-center gap-4">
          <div>
            <label class="block text-sm font-medium text-white mb-2">สถานะ</label>
            <select v-model="filterStatus" class="px-4 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white text-sm">
              <option value="all">ทั้งหมด</option>
              <option value="pending">รอพิจารณา</option>
              <option value="reviewed">ตรวจสอบแล้ว</option>
              <option value="interview">นัดสัมภาษณ์</option>
              <option value="accepted">ผ่าน</option>
              <option value="rejected">ไม่ผ่าน</option>
            </select>
          </div>
          
          <div>
            <label class="block text-sm font-medium text-white mb-2">ประสบการณ์</label>
            <select v-model="filterExperience" class="px-4 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white text-sm">
              <option value="all">ทั้งหมด</option>
              <option value="0-1">0-1 ปี</option>
              <option value="2-3">2-3 ปี</option>
              <option value="4-5">4-5 ปี</option>
              <option value="5+">5+ ปี</option>
            </select>
          </div>
          
          <div class="flex-1">
            <label class="block text-sm font-medium text-white mb-2">ค้นหา</label>
            <input 
              v-model="searchQuery" 
              type="text" 
              placeholder="ค้นหาชื่อ, ทักษะ, หรือตำแหน่ง"
              class="w-full px-4 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
            >
          </div>
        </div>
      </div>

      <!-- Applicants List -->
      <div class="space-y-4">
        <div v-for="applicant in filteredApplicants" :key="applicant.id" 
          class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl hover:bg-white/15 transition-all duration-300">
          <div class="flex items-start gap-6">
            <!-- Avatar -->
            <div class="flex-shrink-0">
              <div class="w-16 h-16 bg-white/20 backdrop-blur-sm rounded-xl overflow-hidden flex items-center justify-center border border-white/30">
                <img :src="applicant.avatar" :alt="applicant.name" class="w-full h-full object-cover">
              </div>
            </div>
            
            <!-- Main Info -->
            <div class="flex-1">
              <div class="flex items-start justify-between mb-3">
                <div>
                  <h3 class="text-xl font-bold text-white mb-1">{{ applicant.name }}</h3>
                  <p class="text-green-200 mb-2">{{ applicant.position }}</p>
                  <div class="flex items-center gap-4 text-sm text-green-100">
                    <span class="flex items-center gap-1">
                      <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                      </svg>
                      {{ applicant.location }}
                    </span>
                    <span class="flex items-center gap-1">
                      <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2-2v2m8 0V6a2 2 0 012 2v6a2 2 0 01-2 2H6a2 2 0 01-2-2V8a2 2 0 012-2V6" />
                      </svg>
                      {{ applicant.experience }} ปี
                    </span>
                    <span class="flex items-center gap-1">
                      <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1" />
                      </svg>
                      {{ applicant.expectedSalary?.toLocaleString() || 'ไม่ระบุ' }} บาท
                    </span>
                  </div>
                </div>
                
                <div class="flex items-center gap-2">
                  <span :class="getStatusClass(applicant.status)" class="px-3 py-1 rounded-full text-xs font-medium">
                    {{ getStatusText(applicant.status) }}
                  </span>
                  <div class="bg-gradient-to-r from-green-400 to-yellow-400 text-green-900 px-3 py-1 rounded-full font-bold text-xs">
                    {{ applicant.matchScore }}% เข้ากัน
                  </div>
                </div>
              </div>
              
              <!-- Skills -->
              <div class="mb-4">
                <div class="flex flex-wrap gap-2">
                  <span v-for="skill in applicant.skills.slice(0, 6)" :key="skill" 
                    class="px-2 py-1 bg-green-500/20 backdrop-blur-sm border border-green-300/30 rounded-full text-xs text-green-100">
                    {{ skill }}
                  </span>
                  <span v-if="applicant.skills.length > 6" 
                    class="px-2 py-1 bg-white/20 backdrop-blur-sm border border-white/30 rounded-full text-xs text-white">
                    +{{ applicant.skills.length - 6 }} อื่นๆ
                  </span>
                </div>
              </div>
              
              <!-- Summary -->
              <p class="text-green-100 text-sm mb-4">{{ applicant.summary }}</p>
              
              <!-- Applied Date -->
              <div class="flex items-center justify-between">
                <span class="text-xs text-green-200">สมัครเมื่อ: {{ formatDate(applicant.appliedDate) }}</span>
                
                <!-- Action Buttons -->
                <div class="flex gap-2">
                  <button @click="viewProfile(applicant.id)" 
                    class="bg-blue-500/20 hover:bg-blue-500/30 border border-blue-300/30 text-blue-200 px-4 py-2 rounded-lg text-sm transition-all duration-300">
                    ดูโปรไฟล์
                  </button>
                  <button @click="downloadResume(applicant.id)" 
                    class="bg-purple-500/20 hover:bg-purple-500/30 border border-purple-300/30 text-purple-200 px-4 py-2 rounded-lg text-sm transition-all duration-300">
                    ดาวน์โหลด CV
                  </button>
                  <select 
                    :value="applicant.status" 
                    @change="updateStatus(applicant.id, $event.target.value)"
                    class="px-3 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-lg text-white text-sm">
                    <option value="pending">รอพิจารณา</option>
                    <option value="reviewed">ตรวจสอบแล้ว</option>
                    <option value="interview">นัดสัมภาษณ์</option>
                    <option value="accepted">ผ่าน</option>
                    <option value="rejected">ไม่ผ่าน</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Empty State -->
      <div v-if="filteredApplicants.length === 0" class="text-center py-12">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-green-300 mx-auto mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
        </svg>
        <p class="text-green-200 text-lg">ไม่พบผู้สมัครที่ตรงกับเงื่อนไข</p>
        <p class="text-green-300 text-sm">ลองเปลี่ยนตัวกรองหรือคำค้นหา</p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'

// ตัวกรอง
const filterStatus = ref('all')
const filterExperience = ref('all')
const searchQuery = ref('')

// ข้อมูลงานที่เลือก
const selectedJob = ref(null)

// ข้อมูลผู้สมัคร (จำลอง)
const applicants = ref([
  {
    id: '1',
    name: 'สมชาย ใจดี',
    position: 'Frontend Developer',
    location: 'กรุงเทพฯ',
    experience: 3,
    expectedSalary: 45000,
    avatar: 'https://placehold.co/100x100/00A155/FFFFFF?text=SC',
    status: 'pending',
    matchScore: 92,
    skills: ['JavaScript', 'Vue.js', 'React', 'TypeScript', 'CSS', 'HTML', 'Node.js'],
    summary: 'นักพัฒนา Frontend ที่มีประสบการณ์ 3 ปี เชี่ยวชาญ Vue.js และ React มีความสนใจในเทคโนโลยีใหม่ๆ',
    appliedDate: '2024-06-12',
    email: 'somchai@example.com',
    phone: '081-234-5678'
  },
  {
    id: '2',
    name: 'สมหญิง รักงาน',
    position: 'Full Stack Developer',
    location: 'นนทบุรี',
    experience: 5,
    expectedSalary: 60000,
    avatar: 'https://placehold.co/100x100/3B82F6/FFFFFF?text=SH',
    status: 'reviewed',
    matchScore: 88,
    skills: ['JavaScript', 'Vue.js', 'Node.js', 'MongoDB', 'Express.js', 'Docker'],
    summary: 'นักพัฒนา Full Stack ที่มีประสบการณ์ครบวงจร สามารถทำงานทั้ง Frontend และ Backend ได้อย่างมีประสิทธิภาพ',
    appliedDate: '2024-06-11',
    email: 'somying@example.com',
    phone: '082-345-6789'
  },
  {
    id: '3',
    name: 'วิชัย เก่งมาก',
    position: 'Senior Frontend Developer',
    location: 'ปทุมธานี',
    experience: 7,
    expectedSalary: 80000,
    avatar: 'https://placehold.co/100x100/EAB308/FFFFFF?text=WK',
    status: 'interview',
    matchScore: 95,
    skills: ['JavaScript', 'Vue.js', 'React', 'Angular', 'TypeScript', 'Webpack', 'Testing'],
    summary: 'Senior Developer ที่มีประสบการณ์มากมายในการพัฒนาแอปพลิเคชันขนาดใหญ่ เชี่ยวชาญหลาย Framework',
    appliedDate: '2024-06-10',
    email: 'wichai@example.com',
    phone: '083-456-7890'
  }
])

// ผู้สมัครที่กรองแล้ว
const filteredApplicants = computed(() => {
  let filtered = applicants.value

  // กรองตามสถานะ
  if (filterStatus.value !== 'all') {
    filtered = filtered.filter(applicant => applicant.status === filterStatus.value)
  }

  // กรองตามประสบการณ์
  if (filterExperience.value !== 'all') {
    const [min, max] = filterExperience.value.includes('+') 
      ? [parseInt(filterExperience.value), Infinity]
      : filterExperience.value.split('-').map(Number)
    
    filtered = filtered.filter(applicant => 
      applicant.experience >= min && (max === undefined || applicant.experience <= max)
    )
  }

  // กรองตามคำค้นหา
  if (searchQuery.value) {
    const query = searchQuery.value.toLowerCase()
    filtered = filtered.filter(applicant =>
      applicant.name.toLowerCase().includes(query) ||
      applicant.position.toLowerCase().includes(query) ||
      applicant.skills.some(skill => skill.toLowerCase().includes(query))
    )
  }

  return filtered
})

// ฟังก์ชันช่วย
const getStatusClass = (status: string) => {
  switch (status) {
    case 'pending':
      return 'bg-yellow-500/20 border border-yellow-300/30 text-yellow-200'
    case 'reviewed':
      return 'bg-blue-500/20 border border-blue-300/30 text-blue-200'
    case 'interview':
      return 'bg-purple-500/20 border border-purple-300/30 text-purple-200'
    case 'accepted':
      return 'bg-green-500/20 border border-green-300/30 text-green-200'
    case 'rejected':
      return 'bg-red-500/20 border border-red-300/30 text-red-200'
    default:
      return 'bg-gray-500/20 border border-gray-300/30 text-gray-200'
  }
}

const getStatusText = (status: string) => {
  switch (status) {
    case 'pending':
      return 'รอพิจารณา'
    case 'reviewed':
      return 'ตรวจสอบแล้ว'
    case 'interview':
      return 'นัดสัมภาษณ์'
    case 'accepted':
      return 'ผ่าน'
    case 'rejected':
      return 'ไม่ผ่าน'
    default:
      return 'ไม่ทราบสถานะ'
  }
}

const formatDate = (dateString: string) => {
  const date = new Date(dateString)
  return date.toLocaleDateString('th-TH')
}

// ฟังก์ชันการจัดการ
const viewProfile = (applicantId: string) => {
  console.log('View profile:', applicantId)
  // นำทางไปยังหน้าโปรไฟล์ผู้สมัคร
}

const downloadResume = (applicantId: string) => {
  console.log('Download resume:', applicantId)
  // ดาวน์โหลด CV
}

const updateStatus = (applicantId: string, newStatus: string) => {
  const applicant = applicants.value.find(a => a.id === applicantId)
  if (applicant) {
    applicant.status = newStatus
    console.log(`Updated ${applicant.name} status to ${newStatus}`)
  }
}

onMounted(() => {
  // โหลดข้อมูลเมื่อคอมโพเนนต์ถูกโหลด
  console.log('Applicants page loaded')
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
