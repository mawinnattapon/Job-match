<script setup lang="ts">
// ตัวแปรสำหรับเก็บข้อมูลงาน
const job = ref(null)
const isLoading = ref(true)
const isFavorite = ref(false)

// ดึง route เพื่อรับ parameter
const route = useRoute()
const jobId = route.params.id

// ฟังก์ชันจำลองการดึงข้อมูลงาน
const fetchJobDetails = () => {
  isLoading.value = true
  
  // จำลองการดึงข้อมูลจาก API
  setTimeout(() => {
    // ข้อมูลตัวอย่างสำหรับการแสดงผล
    job.value = {
      id: '1',
      title: 'นักพัฒนาซอฟต์แวร์ Full Stack',
      company: 'บริษัท เทคโนโลยี ไทย จำกัด',
      logo: 'https://placehold.co/200x200/00A155/FFFFFF?text=TT',
      location: 'กรุงเทพมหานคร (ทำงานที่ออฟฟิศ)',
      salary: '60,000 - 120,000 บาท/เดือน',
      employmentType: 'งานประจำ',
      experience: '3-5 ปี',
      postedDate: '2 วันที่แล้ว',
      matchScore: 95,
      tags: ['JavaScript', 'Vue.js', 'Node.js', 'SQL', 'DevOps'],
      applicants: 12,
      views: 145,
      deadline: '30 มิถุนายน 2568',
      description: 'เราเป็นบริษัทเทคโนโลยีชั้นนำที่กำลังมองหานักพัฒนาซอฟต์แวร์ Full Stack ที่มีความสามารถและมีประสบการณ์ในการพัฒนาเว็บแอปพลิเคชันที่ทันสมัย',
      responsibilities: [
        'พัฒนาและดูแลเว็บแอปพลิเคชันทั้งส่วน Frontend และ Backend',
        'ทำงานร่วมกับทีมออกแบบและทีมผลิตภัณฑ์เพื่อสร้างประสบการณ์ผู้ใช้ที่ดี',
        'เขียนโค้ดที่มีคุณภาพและทำการทดสอบระบบ',
        'ปรับปรุงประสิทธิภาพของระบบและแก้ไขปัญหาที่เกิดขึ้น',
        'ร่วมในการวางแผนและพัฒนาฟีเจอร์ใหม่ๆ'
      ],
      requirements: [
        'ปริญญาตรีสาขาวิทยาการคอมพิวเตอร์ หรือสาขาที่เกี่ยวข้อง',
        'ประสบการณ์ในการพัฒนาเว็บแอปพลิเคชัน 3-5 ปี',
        'มีความเชี่ยวชาญใน JavaScript, Vue.js, Node.js',
        'มีประสบการณ์ในการใช้ฐานข้อมูล SQL และ NoSQL',
        'เข้าใจหลักการ DevOps และมีประสบการณ์ในการใช้ Git'
      ],
      welfare: [
        'สวัสดิการด้านสุขภาพ',
        'สวัสดิการด้านการเงิน',
        'สวัสดิการด้านการเรียนรู้และการพัฒนาตนเอง'
      ],
      companyInfo: {
        name: 'บริษัท เทคโนโลยี ไทย จำกัด',
        description: 'เราเป็นบริษัทเทคโนโลยีชั้นนำที่มีประสบการณ์ยาวนานในการพัฒนาโซลูชันเทคโนโลยีสำหรับธุรกิจต่างๆ',
        address: 'กรุงเทพมหานคร',
        phone: '02-123-4567',
        email: 'info@techthai.co.th'
      }
    }
    isLoading.value = false
  }, 1000)
}

// ฟังก์ชันสำหรับเพิ่ม/ลบงานที่ชื่นชอบ
const toggleFavorite = () => {
  isFavorite.value = !isFavorite.value
  // ในเวอร์ชันจริงจะมีการบันทึกลงฐานข้อมูล
}

// ฟังก์ชันสำหรับการสมัครงาน
const applyForJob = () => {
  // ในเวอร์ชันจริงจะมีการส่งข้อมูลไปยังเซิร์ฟเวอร์
  alert('ระบบได้รับการสมัครงานของคุณแล้ว')
}

// ฟังก์ชันสำหรับแชร์งาน
const shareJob = () => {
  // ในเวอร์ชันจริงจะมีการเปิด dialog สำหรับแชร์
  alert('คัดลอก URL สำหรับแชร์แล้ว')
}

// เรียกใช้ฟังก์ชันเมื่อโหลดหน้า
onMounted(() => {
  fetchJobDetails()
})
</script>

<template>
  <div class="min-h-screen bg-gray-50 pb-12">
    <!-- ส่วนหัวของหน้า -->
    <div class="bg-gradient-to-r from-green-600 to-green-700 pt-8 pb-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center">
          <button 
            class="mr-4 bg-white/20 hover:bg-white/30 text-white rounded-full p-2 transition-all duration-300"
            @click="$router.back()"
          >
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
            </svg>
          </button>
          <h1 class="text-2xl font-bold text-white">รายละเอียดงาน</h1>
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
      
      <!-- แสดงข้อมูลงาน -->
      <div v-else class="bg-white rounded-lg shadow-md overflow-hidden">
        <!-- ส่วนหัวข้อมูลงาน -->
        <div class="p-6 border-b border-gray-200">
          <div class="flex flex-col md:flex-row md:items-start">
            <!-- โลโก้บริษัท -->
            <div class="flex-shrink-0 mb-4 md:mb-0 md:mr-6">
              <div class="w-20 h-20 bg-gray-100 rounded-lg overflow-hidden flex items-center justify-center">
                <img :src="job.logo" :alt="job.company" class="w-full h-full object-cover">
              </div>
            </div>
            
            <!-- ข้อมูลหลัก -->
            <div class="flex-grow">
              <div class="flex flex-col md:flex-row md:items-center justify-between">
                <h1 class="text-2xl font-bold text-gray-900">{{ job.title }}</h1>
                
                <!-- คะแนนการแมช -->
                <div class="mt-2 md:mt-0 flex items-center">
                  <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                    แมช {{ job.matchScore }}%
                  </span>
                </div>
              </div>
              
              <!-- ชื่อบริษัทและสถานที่ -->
              <div class="mt-2">
                <h2 class="text-lg font-medium text-gray-700">{{ job.company }}</h2>
                <div class="mt-1 flex items-center text-gray-600">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                  {{ job.location }}
                </div>
              </div>
              
              <!-- แท็กทักษะ -->
              <div class="mt-3 flex flex-wrap gap-2">
                <span 
                  v-for="(tag, index) in job.tags" 
                  :key="index"
                  class="inline-flex items-center px-2.5 py-0.5 rounded-md text-sm font-medium bg-green-50 text-green-700"
                >
                  {{ tag }}
                </span>
              </div>
              
              <!-- ข้อมูลเพิ่มเติม -->
              <div class="mt-4 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3 text-sm">
                <div class="flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  <span>{{ job.salary }}</span>
                </div>
                <div class="flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                  </svg>
                  <span>{{ job.employmentType }}</span>
                </div>
                <div class="flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                  </svg>
                  <span>โพสต์เมื่อ {{ job.postedDate }}</span>
                </div>
                <div class="flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  <span>ประสบการณ์ {{ job.experience }}</span>
                </div>
                <div class="flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                  </svg>
                  <span>{{ job.applicants }} คนสมัคร</span>
                </div>
                <div class="flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                  </svg>
                  <span>{{ job.views }} คนดู</span>
                </div>
              </div>
            </div>
          </div>
          
          <!-- ปุ่มดำเนินการ -->
          <div class="mt-6 flex flex-wrap gap-3">
            <button 
              @click="applyForJob"
              class="flex-1 sm:flex-none inline-flex justify-center items-center px-6 py-2.5 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors duration-300"
            >
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              สมัครงานนี้
            </button>
            <button 
              @click="toggleFavorite"
              class="flex-1 sm:flex-none inline-flex justify-center items-center px-6 py-2.5 border border-gray-300 text-base font-medium rounded-md shadow-sm text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors duration-300"
            >
              <svg v-if="isFavorite" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-red-500" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />
              </svg>
              <svg v-else xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
              </svg>
              {{ isFavorite ? 'เลิกถูกใจ' : 'ถูกใจ' }}
            </button>
            <button 
              @click="shareJob"
              class="flex-1 sm:flex-none inline-flex justify-center items-center px-6 py-2.5 border border-gray-300 text-base font-medium rounded-md shadow-sm text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors duration-300"
            >
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z" />
              </svg>
              แชร์
            </button>
          </div>
          
          <!-- วันหมดเขต -->
          <div class="mt-4 text-sm text-gray-600">
            <span class="font-medium">วันหมดเขตรับสมัคร:</span> {{ job.deadline }}
          </div>
        </div>
        
        <!-- ส่วนแสดงรายละเอียดงาน -->
        <div class="p-6">
          <h2 class="text-lg font-medium text-gray-900">รายละเอียดงาน</h2>
          <p class="mt-2 text-sm text-gray-600">{{ job.description }}</p>
          <h3 class="mt-4 text-lg font-medium text-gray-900">ความรับผิดชอบ</h3>
          <ul class="mt-2 list-disc list-inside text-sm text-gray-600">
            <li v-for="(responsibility, index) in job.responsibilities" :key="index">{{ responsibility }}</li>
          </ul>
          <h3 class="mt-4 text-lg font-medium text-gray-900">คุณสมบัติผู้สมัคร</h3>
          <ul class="mt-2 list-disc list-inside text-sm text-gray-600">
            <li v-for="(requirement, index) in job.requirements" :key="index">{{ requirement }}</li>
          </ul>
          <h3 class="mt-4 text-lg font-medium text-gray-900">สวัสดิการ</h3>
          <ul class="mt-2 list-disc list-inside text-sm text-gray-600">
            <li v-for="(welfare, index) in job.welfare" :key="index">{{ welfare }}</li>
          </ul>
          <h3 class="mt-4 text-lg font-medium text-gray-900">ข้อมูลบริษัท</h3>
          <div class="mt-2 text-sm text-gray-600">
            <p>ชื่อบริษัท: {{ job.companyInfo.name }}</p>
            <p>ที่ตั้ง: {{ job.companyInfo.address }}</p>
            <p>โทรศัพท์: {{ job.companyInfo.phone }}</p>
            <p>อีเมล์: {{ job.companyInfo.email }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>