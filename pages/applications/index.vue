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

<template>
  <div class="min-h-screen bg-gray-50 pb-12">
    <!-- ส่วนหัวของหน้า -->
    <div class="bg-gradient-to-r from-green-600 to-green-700 pt-8 pb-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between">
          <div>
            <h1 class="text-2xl font-bold text-white">ประวัติการสมัครงาน</h1>
            <p class="mt-1 text-green-100">ติดตามสถานะการสมัครงานของคุณ</p>
          </div>
          <div class="text-white text-right">
            <div class="text-2xl font-bold">{{ applications.length }}</div>
            <div class="text-sm text-green-100">งานที่สมัคร</div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- ส่วนเนื้อหา -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-8">
      <!-- แสดงสถานะกำลังโหลด -->
      <div v-if="isLoading" class="bg-white rounded-lg shadow-md p-8 flex justify-center items-center min-h-[400px]">
        <div class="text-center">
          <svg class="animate-spin h-12 w-12 text-green-600 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
          </svg>
          <p class="mt-4 text-lg text-gray-600">กำลังโหลดข้อมูล...</p>
        </div>
      </div>
      
      <!-- ส่วนกรองและค้นหา -->
      <div v-else class="bg-white rounded-lg shadow-md p-6 mb-6">
        <div class="flex flex-col md:flex-row gap-4">
          <!-- ค้นหา -->
          <div class="flex-1">
            <div class="relative">
              <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
              </div>
              <input
                v-model="searchQuery"
                type="text"
                placeholder="ค้นหาตำแหน่งงาน, บริษัท, หรือสถานที่..."
                class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-md leading-5 bg-white placeholder-gray-500 focus:outline-none focus:placeholder-gray-400 focus:ring-1 focus:ring-green-500 focus:border-green-500"
              >
            </div>
          </div>
          
          <!-- กรองตามสถานะ -->
          <div class="md:w-48">
            <select
              v-model="selectedStatus"
              class="block w-full px-3 py-2 border border-gray-300 rounded-md leading-5 bg-white focus:outline-none focus:ring-1 focus:ring-green-500 focus:border-green-500"
            >
              <option v-for="status in statusOptions" :key="status.value" :value="status.value">
                {{ status.label }}
              </option>
            </select>
          </div>
        </div>
      </div>
      
      <!-- รายการการสมัครงาน -->
      <div v-if="!isLoading" class="space-y-4">
        <!-- แสดงเมื่อไม่มีข้อมูล -->
        <div v-if="filteredApplications.length === 0" class="bg-white rounded-lg shadow-md p-8 text-center">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-gray-400 mx-auto mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
          <h3 class="text-lg font-medium text-gray-900 mb-2">ไม่พบข้อมูลการสมัครงาน</h3>
          <p class="text-gray-600">ลองเปลี่ยนเงื่อนไขการค้นหาหรือกรองข้อมูล</p>
        </div>
        
        <!-- รายการการสมัครงาน -->
        <div v-else class="space-y-4">
          <div
            v-for="application in filteredApplications"
            :key="application.id"
            class="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300"
          >
            <div class="p-6">
              <div class="flex items-start justify-between">
                <!-- ข้อมูลงาน -->
                <div class="flex items-start space-x-4 flex-1">
                  <!-- โลโก้บริษัท -->
                  <div class="flex-shrink-0">
                    <img :src="application.companyLogo" :alt="application.company" class="w-12 h-12 rounded-lg object-cover">
                  </div>
                  
                  <!-- รายละเอียดงาน -->
                  <div class="flex-1 min-w-0">
                    <div class="flex items-start justify-between">
                      <div class="flex-1">
                        <h3 class="text-lg font-semibold text-gray-900 mb-1">{{ application.jobTitle }}</h3>
                        <p class="text-gray-600 mb-2">{{ application.company }}</p>
                        
                        <div class="flex flex-wrap items-center gap-4 text-sm text-gray-500 mb-3">
                          <div class="flex items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                            {{ application.location }}
                          </div>
                          <div class="flex items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1" />
                            </svg>
                            {{ application.salary }}
                          </div>
                          <div class="flex items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                            สมัครเมื่อ {{ formatDate(application.appliedDate) }}
                          </div>
                        </div>
                        
                        <!-- คะแนนการแมช -->
                        <div class="flex items-center mb-3">
                          <span class="text-sm text-gray-600 mr-2">ความเข้ากัน:</span>
                          <div class="flex items-center">
                            <div class="w-16 bg-gray-200 rounded-full h-2 mr-2">
                              <div class="bg-green-600 h-2 rounded-full" :style="`width: ${application.matchScore}%`"></div>
                            </div>
                            <span class="text-sm font-medium text-green-600">{{ application.matchScore }}%</span>
                          </div>
                        </div>
                        
                        <!-- หมายเหตุ -->
                        <p v-if="application.notes" class="text-sm text-gray-600 bg-gray-50 p-3 rounded-md">
                          {{ application.notes }}
                        </p>
                      </div>
                      
                      <!-- สถานะและปุ่มดำเนินการ -->
                      <div class="flex flex-col items-end space-y-3 ml-4">
                        <!-- สถานะ -->
                        <span 
                          :class="`inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-${getStatusColor(application.status)}-100 text-${getStatusColor(application.status)}-800`"
                        >
                          {{ getStatusLabel(application.status) }}
                        </span>
                        
                        <!-- ปุ่มดำเนินการ -->
                        <div class="flex space-x-2">
                          <button
                            @click="viewJobDetails(application.id)"
                            class="inline-flex items-center px-3 py-1.5 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors duration-300"
                          >
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                            ดูรายละเอียด
                          </button>
                          
                          <button
                            v-if="application.status === 'pending' || application.status === 'reviewing'"
                            @click="cancelApplication(application.id)"
                            class="inline-flex items-center px-3 py-1.5 border border-red-300 text-sm font-medium rounded-md text-red-700 bg-white hover:bg-red-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 transition-colors duration-300"
                          >
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
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
      </div>
    </div>
  </div>
</template>
