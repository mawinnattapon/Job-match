<template>
  <!-- ... (template ส่วนนี้ไม่มีการเปลี่ยนแปลง) -->
  <div class="min-h-screen bg-gradient-to-br from-green-500 via-blue-600 to-yellow-500 relative overflow-hidden">
    <!-- Animated Background -->
    <div class="absolute inset-0">
      <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-green-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob"></div>
      <div class="absolute top-1/3 right-1/4 w-80 h-80 bg-blue-300 rounded-full mix-blend-multiply filter blur-3xl opacity-25 animate-blob animation-delay-2000"></div>
      <div class="absolute bottom-1/4 left-1/3 w-72 h-72 bg-purple-400 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-4000"></div>
    </div>

    <!-- Header -->
    <div class="relative z-10 bg-white/10 backdrop-blur-md border-b border-white/20">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div class="flex items-center justify-between">
          <div>
            <h1 class="text-4xl font-bold text-white mb-2">ประวัติการสมัครงาน</h1>
            <p class="text-green-200 text-lg">ติดตามสถานะการสมัครงานของคุณ</p>
          </div>
          <div class="hidden md:flex items-center space-x-6">
            <div class="text-center">
              <div class="text-3xl font-bold text-white">{{ applications.length }}</div>
              <div class="text-sm text-green-200">งานที่สมัคร</div>
            </div>
            <div class="text-center">
              <div class="text-3xl font-bold text-yellow-300">{{ acceptedCount }}</div>
              <div class="text-sm text-green-200">ได้รับการตอบรับ</div>
            </div>
            <div class="text-center">
              <div class="text-3xl font-bold text-blue-300">{{ pendingCount }}</div>
              <div class="text-sm text-green-200">รอการพิจารณา</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Content -->
    <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Loading State -->
      <div v-if="isLoading" class="flex justify-center py-12">
        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
          <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-white mx-auto"></div>
          <p class="mt-4 text-lg text-white text-center">กำลังโหลดข้อมูล...</p>
        </div>
      </div>

      <!-- Filters and Search -->
      <div v-else class="bg-white/10 backdrop-blur-md rounded-2xl p-6 mb-8 border border-white/20 shadow-2xl">
        <div class="flex flex-col md:flex-row gap-4">
          <!-- Search -->
          <div class="flex-1">
            <div class="relative">
              <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-green-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
              </div>
              <input
                v-model="searchQuery"
                type="text"
                placeholder="ค้นหาตำแหน่งงาน บริษัท หรือสถานที่..."
                class="block w-full pl-10 pr-3 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400 focus:border-transparent transition-all duration-300"
              />
            </div>
          </div>
          
          <!-- Status Filter -->
          <div class="md:w-48">
            <select
              v-model="selectedStatus"
              class="block w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-green-400 focus:border-transparent transition-all duration-300"
            >
              <option v-for="status in statusOptions" :key="status.value" :value="status.value" class="bg-gray-800 text-white">
                {{ status.label }}
              </option>
            </select>
          </div>
        </div>
      </div>

      <!-- Applications List -->
      <div v-if="!isLoading" class="space-y-6">
        <!-- Empty State -->
        <div v-if="filteredApplications.length === 0" class="bg-white/10 backdrop-blur-md rounded-2xl p-12 text-center border border-white/20 shadow-2xl">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-green-300 mx-auto mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
          <p class="text-xl text-white mb-2">ไม่พบข้อมูลการสมัครงาน</p>
          <p class="text-green-200">ลองเปลี่ยนเงื่อนไขการค้นหาหรือกรองข้อมูล</p>
        </div>

        <!-- Application Cards -->
        <div v-else class="space-y-6">
          <div
            v-for="(application, index) in filteredApplications"
            :key="application.id"
            class="bg-white/10 backdrop-blur-md rounded-2xl border border-white/20 shadow-2xl hover:bg-white/15 transition-all duration-300 group"
            :style="{ animationDelay: `${index * 100}ms` }"
          >
            <div class="p-8">
              <div class="flex flex-col lg:flex-row lg:items-start lg:justify-between">
                <!-- Main Content -->
                <div class="flex-1">
                  <div class="flex items-start space-x-4">
                    <!-- Company Logo -->
                    <div class="flex-shrink-0">
                      <img :src="application.companyLogo" :alt="application.company" class="w-16 h-16 rounded-xl object-cover border-2 border-white/20">
                    </div>
                    
                    <!-- Job Info -->
                    <div class="flex-1 min-w-0">
                      <h3 class="text-2xl font-bold text-white mb-2 group-hover:text-yellow-300 transition-colors">
                        {{ application.jobTitle }}
                      </h3>
                      <p class="text-lg text-green-200 font-medium mb-2">{{ application.company }}</p>
                      
                      <div class="flex flex-wrap items-center gap-4 text-sm text-green-100 mb-4">
                        <span class="flex items-center gap-1">
                          <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                          </svg>
                          {{ application.location }}
                        </span>
                        <span class="flex items-center gap-1">
                          <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1" />
                          </svg>
                          {{ application.salary }}
                        </span>
                        <span class="flex items-center gap-1">
                          <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                          </svg>
                          {{ formatDate(application.appliedDate) }}
                        </span>
                      </div>
                      
                      <!-- Match Score -->
                      <div class="flex items-center mb-4">
                        <span class="text-sm text-green-200 mr-3">ความเข้ากัน:</span>
                        <div class="flex items-center">
                          <div class="w-24 bg-white/20 rounded-full h-2 mr-3">
                            <div 
                              class="bg-gradient-to-r from-green-400 to-yellow-400 h-2 rounded-full transition-all duration-1000 ease-out" 
                              :style="`width: ${application.matchScore}%`"
                            ></div>
                          </div>
                          <span class="text-sm font-bold text-yellow-300">{{ application.matchScore }}%</span>
                        </div>
                      </div>
                      
                      <!-- Notes -->
                      <div v-if="application.notes" class="bg-white/10 backdrop-blur-sm rounded-xl p-4 border border-white/20">
                        <p class="text-sm text-green-100">{{ application.notes }}</p>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- Status and Actions -->
                <div class="flex flex-col items-end space-y-4 mt-6 lg:mt-0 lg:ml-6">
                  <!-- Status Badge -->
                  <span 
                    :class="`inline-flex items-center px-4 py-2 rounded-xl text-sm font-bold border-2 ${getStatusStyles(application.status)}`"
                  >
                    <div :class="`w-2 h-2 rounded-full mr-2 ${getStatusDotColor(application.status)}`"></div>
                    {{ getStatusLabel(application.status) }}
                  </span>
                  
                  <!-- Action Buttons -->
                  <div class="flex flex-col sm:flex-row gap-3">
                    <button
                      @click="viewJobDetails(application.id)"
                      class="inline-flex items-center px-4 py-2 bg-blue-500/20 hover:bg-blue-500/30 border border-blue-300/30 text-blue-200 rounded-xl text-sm font-medium transition-all duration-300 hover:scale-105"
                    >
                      <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                      </svg>
                      ดูรายละเอียด
                    </button>
                    
                    <button
                      v-if="application.status === 'pending' || application.status === 'reviewing'"
                      @click="cancelApplication(application.id)"
                      class="inline-flex items-center px-4 py-2 bg-red-500/20 hover:bg-red-500/30 border border-red-300/30 text-red-200 rounded-xl text-sm font-medium transition-all duration-300 hover:scale-105"
                    >
                      <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                      </svg>
                      ยกเลิก
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
// ตัวแปรสำหรับเก็บข้อมูลการสมัครงาน
const applications = ref([])
const isLoading = ref(true)
const selectedStatus = ref('all')
const searchQuery = ref('')

// สถานะการสมัครงาน
const statusOptions = [
  { value: 'all', label: 'ทั้งหมด', color: 'gray' },
  { value: 'pending', label: 'รอการพิจารณา', color: 'yellow' },
  { value: 'reviewing', label: 'กำลังพิจารณา', color: 'blue' },
  { value: 'interview', label: 'นัดสัมภาษณ์', color: 'purple' },
  { value: 'accepted', label: 'ได้รับการตอบรับ', color: 'green' },
  { value: 'rejected', label: 'ไม่ได้รับการตอบรับ', color: 'red' }
]

// ฟังก์ชันจำลองการดึงข้อมูลการสมัครงาน
const fetchApplications = () => {
  isLoading.value = true
  
  // จำลองการดึงข้อมูลจาก API
  setTimeout(() => {
    applications.value = [
      {
        id: '1',
        jobTitle: 'นักพัฒนาซอฟต์แวร์ Full Stack',
        company: 'บริษัท เทคโนโลยี ไทย จำกัด',
        companyLogo: 'https://placehold.co/60x60/00A155/FFFFFF?text=TT',
        location: 'กรุงเทพมหานคร',
        salary: '50,000 - 70,000 บาท',
        appliedDate: '2024-06-10',
        status: 'interview',
        matchScore: 92,
        notes: 'ได้รับการติดต่อเพื่อนัดสัมภาษณ์ในวันที่ 15 มิถุนายน 2567'
      },
      {
        id: '2',
        jobTitle: 'Frontend Developer',
        company: 'บริษัท ดิจิทัล โซลูชัน จำกัด',
        companyLogo: 'https://placehold.co/60x60/3B82F6/FFFFFF?text=DS',
        location: 'กรุงเทพมหานคร',
        salary: '40,000 - 55,000 บาท',
        appliedDate: '2024-06-08',
        status: 'reviewing',
        matchScore: 88,
        notes: 'ส่งเอกสารเพิ่มเติมแล้ว รอการพิจารณา'
      },
      {
        id: '3',
        jobTitle: 'Backend Developer',
        company: 'บริษัท อินโนเวชั่น เทค จำกัด',
        companyLogo: 'https://placehold.co/60x60/8B5CF6/FFFFFF?text=IT',
        location: 'นนทบุรี',
        salary: '45,000 - 60,000 บาท',
        appliedDate: '2024-06-05',
        status: 'accepted',
        matchScore: 95,
        notes: 'ได้รับการตอบรับแล้ว! เริ่มงานวันที่ 1 กรกฎาคม 2567'
      },
      {
        id: '4',
        jobTitle: 'UI/UX Designer',
        company: 'บริษัท ครีเอทีฟ ดีไซน์ จำกัด',
        companyLogo: 'https://placehold.co/60x60/F59E0B/FFFFFF?text=CD',
        location: 'กรุงเทพมหานคร',
        salary: '35,000 - 45,000 บาท',
        appliedDate: '2024-06-03',
        status: 'rejected',
        matchScore: 78,
        notes: 'ไม่ผ่านการคัดเลือก เนื่องจากประสบการณ์ยังไม่เพียงพอ'
      },
      {
        id: '5',
        jobTitle: 'DevOps Engineer',
        company: 'บริษัท คลาวด์ เซอร์วิส จำกัด',
        companyLogo: 'https://placehold.co/60x60/EF4444/FFFFFF?text=CS',
        location: 'กรุงเทพมหานคร',
        salary: '60,000 - 80,000 บาท',
        appliedDate: '2024-06-01',
        status: 'pending',
        matchScore: 85,
        notes: 'รอการพิจารณาจากทีม HR'
      }
    ]
    isLoading.value = false
  }, 1000)
}

// ฟังก์ชันกรองข้อมูลตามสถานะและคำค้นหา
const filteredApplications = computed(() => {
  let filtered = applications.value

  // กรองตามสถานะ
  if (selectedStatus.value !== 'all') {
    filtered = filtered.filter(app => app.status === selectedStatus.value)
  }

  // กรองตามคำค้นหา
  if (searchQuery.value) {
    const query = searchQuery.value.toLowerCase()
    filtered = filtered.filter(app => 
      app.jobTitle.toLowerCase().includes(query) ||
      app.company.toLowerCase().includes(query) ||
      app.location.toLowerCase().includes(query)
    )
  }

  return filtered
})

// สถิติการสมัครงาน
const acceptedCount = computed(() => {
  return applications.value.filter(app => app.status === 'accepted').length
})

const pendingCount = computed(() => {
  return applications.value.filter(app => app.status === 'pending' || app.status === 'reviewing').length
})

// ฟังก์ชันแปลงสถานะเป็นสี
const getStatusColor = (status) => {
  const statusOption = statusOptions.find(option => option.value === status)
  return statusOption ? statusOption.color : 'gray'
}

// ฟังก์ชันแปลงสถานะเป็นข้อความ
const getStatusLabel = (status) => {
  const statusOption = statusOptions.find(option => option.value === status)
  return statusOption ? statusOption.label : status
}

// ฟังก์ชันสำหรับสไตล์สถานะใหม่
const getStatusStyles = (status) => {
  const styles = {
    pending: 'bg-yellow-500/20 text-yellow-200 border-yellow-300/30',
    reviewing: 'bg-blue-500/20 text-blue-200 border-blue-300/30',
    interview: 'bg-purple-500/20 text-purple-200 border-purple-300/30',
    accepted: 'bg-green-500/20 text-green-200 border-green-300/30',
    rejected: 'bg-red-500/20 text-red-200 border-red-300/30'
  }
  return styles[status] || 'bg-gray-500/20 text-gray-200 border-gray-300/30'
}

// ฟังก์ชันสำหรับจุดสีสถานะ
const getStatusDotColor = (status) => {
  const colors = {
    pending: 'bg-yellow-400',
    reviewing: 'bg-blue-400',
    interview: 'bg-purple-400',
    accepted: 'bg-green-400',
    rejected: 'bg-red-400'
  }
  return colors[status] || 'bg-gray-400'
}

// ฟังก์ชันแปลงวันที่
const formatDate = (dateString) => {
  const date = new Date(dateString)
  return date.toLocaleDateString('th-TH', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

// ฟังก์ชันดูรายละเอียดงาน
const viewJobDetails = (applicationId) => {
  // ในเวอร์ชันจริงจะนำทางไปยังหน้ารายละเอียดงาน
  navigateTo(`/work/details?id=${applicationId}`)
}

// ฟังก์ชันยกเลิกการสมัคร
const cancelApplication = (applicationId) => {
  if (confirm('คุณต้องการยกเลิกการสมัครงานนี้หรือไม่?')) {
    // ในเวอร์ชันจริงจะส่งคำขอไปยังเซิร์ฟเวอร์
    const index = applications.value.findIndex(app => app.id === applicationId)
    if (index !== -1) {
      applications.value.splice(index, 1)
      alert('ยกเลิกการสมัครงานเรียบร้อยแล้ว')
    }
  }
}

// เรียกใช้ฟังก์ชันเมื่อโหลดหน้า
onMounted(() => {
  fetchApplications()
})
</script>

<style scoped>
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

.animate-blob {
  animation: blob 7s infinite;
}

.animation-delay-2000 {
  animation-delay: 2s;
}

.animation-delay-4000 {
  animation-delay: 4s;
}

/* Fade in animation for cards */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.space-y-6 > div {
  animation: fadeInUp 0.6s ease-out forwards;
}
</style>
