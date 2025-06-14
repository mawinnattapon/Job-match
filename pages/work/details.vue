<template>
  <!-- ... (template ส่วนนี้ไม่มีการเปลี่ยนแปลง) -->
  <div class="min-h-screen bg-gradient-to-br from-green-500 via-blue-600 to-yellow-500 relative overflow-hidden">
    <!-- Animated Background -->
    <div class="absolute inset-0">
      <!-- Floating Blobs -->
      <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-green-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob"></div>
      <div class="absolute top-1/3 right-1/4 w-80 h-80 bg-blue-300 rounded-full mix-blend-multiply filter blur-3xl opacity-25 animate-blob animation-delay-2000"></div>
      <div class="absolute bottom-1/4 left-1/3 w-72 h-72 bg-purple-400 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-4000"></div>
      <div class="absolute bottom-1/3 right-1/3 w-80 h-80 bg-yellow-300 rounded-full mix-blend-multiply filter blur-3xl opacity-15 animate-blob animation-delay-6000"></div>
      
      <!-- Sparkle Effects -->
      <div class="absolute top-20 left-20 w-2 h-2 bg-white rounded-full animate-pulse"></div>
      <div class="absolute top-40 right-32 w-1 h-1 bg-green-200 rounded-full animate-ping"></div>
      <div class="absolute bottom-40 left-40 w-1.5 h-1.5 bg-white rounded-full animate-pulse animation-delay-1000"></div>
      <div class="absolute bottom-20 right-20 w-2 h-2 bg-green-200 rounded-full animate-ping animation-delay-2000"></div>
    </div>

    <!-- Header -->
    <div class="relative z-10 bg-white/10 backdrop-blur-md border-b border-white/20">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <div class="flex items-center justify-between">
          <button @click="$router.go(-1)" class="inline-flex items-center text-white hover:text-green-200 transition-colors">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
            </svg>
            กลับไปหน้าค้นหา
          </button>
          <h1 class="text-2xl font-bold text-white">รายละเอียดงาน</h1>
          <div class="w-32"></div> <!-- Spacer -->
        </div>
      </div>
    </div>
    
    <!-- Content -->
    <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Loading State -->
      <div v-if="isLoading" class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl flex justify-center items-center min-h-[400px]">
        <div class="text-center">
          <svg class="animate-spin h-12 w-12 text-white mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
          </svg>
          <p class="mt-4 text-lg text-white">กำลังโหลดข้อมูล...</p>
        </div>
      </div>

      <!-- Job Details -->
      <div v-else class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Main Content -->
        <div class="lg:col-span-2 space-y-6">
          <!-- Job Header Card -->
          <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
            <div class="flex flex-col md:flex-row md:items-start gap-6">
              <!-- Company Logo -->
              <div class="flex-shrink-0">
                <div class="w-20 h-20 bg-white/20 backdrop-blur-sm rounded-xl overflow-hidden flex items-center justify-center border border-white/30">
                  <img :src="job.logo" :alt="job.company" class="w-full h-full object-cover">
                </div>
              </div>
              
              <!-- Job Info -->
              <div class="flex-grow">
                <div class="flex flex-col md:flex-row md:items-start justify-between gap-4">
                  <div>
                    <h1 class="text-3xl font-bold text-white mb-2">{{ job.title }}</h1>
                    <h2 class="text-xl font-medium text-green-200 mb-3">{{ job.company }}</h2>
                    
                    <!-- Location & Salary -->
                    <div class="space-y-2">
                      <div class="flex items-center text-green-100">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                        {{ job.location }}
                      </div>
                      <div class="flex items-center text-green-100">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1" />
                        </svg>
                        {{ job.salary }}
                      </div>
                    </div>
                  </div>
                  
                  <!-- Match Score -->
                  <div class="flex-shrink-0">
                    <div class="bg-gradient-to-r from-green-400 to-yellow-400 text-green-900 px-4 py-2 rounded-full font-bold text-lg">
                      แมช {{ job.matchScore }}%
                    </div>
                  </div>
                </div>
                
                <!-- Tags -->
                <div class="mt-4 flex flex-wrap gap-2">
                  <span v-for="tag in job.tags" :key="tag" 
                    class="px-3 py-1 bg-white/20 backdrop-blur-sm border border-white/30 rounded-full text-sm text-white">
                    {{ tag }}
                  </span>
                </div>
                
                <!-- Job Stats -->
                <div class="mt-4 grid grid-cols-3 gap-4 text-sm">
                  <div class="text-center">
                    <div class="text-white font-semibold">{{ job.employmentType }}</div>
                    <div class="text-green-200">ประเภทงาน</div>
                  </div>
                  <div class="text-center">
                    <div class="text-white font-semibold">{{ job.experience }}</div>
                    <div class="text-green-200">ประสบการณ์</div>
                  </div>
                  <div class="text-center">
                    <div class="text-white font-semibold">{{ job.views }} คน</div>
                    <div class="text-green-200">ดูแล้ว</div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Action Buttons -->
            <div class="mt-6 flex flex-col sm:flex-row gap-3">
              <button @click="applyForJob" 
                class="flex-1 bg-gradient-to-r from-green-400 to-yellow-400 hover:from-green-500 hover:to-yellow-500 text-green-900 font-bold py-3 px-6 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg">
                สมัครงานนี้
              </button>
              <button @click="toggleFavorite"
                class="bg-white/20 backdrop-blur-sm border border-white/30 text-white hover:bg-white/30 font-medium py-3 px-6 rounded-xl transition-all duration-300 flex items-center justify-center gap-2">
                <svg v-if="isFavorite" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-red-400" viewBox="0 0 20 20" fill="currentColor">
                  <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />
                </svg>
                <svg v-else xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                </svg>
                {{ isFavorite ? 'เลิกถูกใจ' : 'ถูกใจ' }}
              </button>
              <button @click="shareJob"
                class="bg-white/20 backdrop-blur-sm border border-white/30 text-white hover:bg-white/30 font-medium py-3 px-6 rounded-xl transition-all duration-300 flex items-center justify-center gap-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z" />
                </svg>
                แชร์
              </button>
            </div>
          </div>

          <!-- Job Description -->
          <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
            <h2 class="text-2xl font-bold text-white mb-4">รายละเอียดงาน</h2>
            <p class="text-green-100 leading-relaxed mb-6">{{ job.description }}</p>
            
            <h3 class="text-xl font-semibold text-white mb-3">ความรับผิดชอบ</h3>
            <ul class="space-y-2 mb-6">
              <li v-for="(responsibility, index) in job.responsibilities" :key="index" 
                class="flex items-start text-green-100">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3 mt-0.5 text-green-300 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
                {{ responsibility }}
              </li>
            </ul>
            
            <h3 class="text-xl font-semibold text-white mb-3">คุณสมบัติผู้สมัคร</h3>
            <ul class="space-y-2 mb-6">
              <li v-for="(requirement, index) in job.requirements" :key="index" 
                class="flex items-start text-green-100">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3 mt-0.5 text-yellow-300 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                {{ requirement }}
              </li>
            </ul>
            
            <h3 class="text-xl font-semibold text-white mb-3">สวัสดิการ</h3>
            <ul class="space-y-2">
              <li v-for="(welfare, index) in job.welfare" :key="index" 
                class="flex items-start text-green-100">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3 mt-0.5 text-blue-300 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v13m0-13V6a2 2 0 112 2h-2zm0 0V5.5A2.5 2.5 0 109.5 8H12zm-7 4h14M5 12a2 2 0 110-4h14a2 2 0 110 4M5 12v7a2 2 0 002 2h10a2 2 0 002-2v-7" />
                </svg>
                {{ welfare }}
              </li>
            </ul>
          </div>
        </div>

        <!-- Sidebar -->
        <div class="space-y-6">
          <!-- Quick Info -->
          <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl">
            <h3 class="text-lg font-semibold text-white mb-4">ข้อมูลสำคัญ</h3>
            <div class="space-y-3">
              <div class="flex justify-between">
                <span class="text-green-200">วันที่ลงประกาศ:</span>
                <span class="text-white">{{ job.postedDate }}</span>
              </div>
              <div class="flex justify-between">
                <span class="text-green-200">วันหมดเขต:</span>
                <span class="text-white">{{ job.deadline }}</span>
              </div>
              <div class="flex justify-between">
                <span class="text-green-200">ผู้สมัครแล้ว:</span>
                <span class="text-white">{{ job.applicants }} คน</span>
              </div>
            </div>
          </div>

          <!-- Company Info -->
          <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl">
            <h3 class="text-lg font-semibold text-white mb-4">ข้อมูลบริษัท</h3>
            <div class="space-y-3">
              <div>
                <span class="text-green-200 block">ชื่อบริษัท:</span>
                <span class="text-white">{{ job.companyInfo.name }}</span>
              </div>
              <div>
                <span class="text-green-200 block">ที่ตั้ง:</span>
                <span class="text-white">{{ job.companyInfo.address }}</span>
              </div>
              <div>
                <span class="text-green-200 block">โทรศัพท์:</span>
                <span class="text-white">{{ job.companyInfo.phone }}</span>
              </div>
              <div>
                <span class="text-green-200 block">อีเมล:</span>
                <span class="text-white">{{ job.companyInfo.email }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'

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
      title: 'Frontend Developer',
      company: 'TechCorp Thailand',
      logo: 'https://placehold.co/200x200/00A155/FFFFFF?text=TC',
      location: 'กรุงเทพฯ (Hybrid)',
      salary: '50,000 - 80,000 บาท/เดือน',
      employmentType: 'Full-time',
      experience: '2-4 ปี',
      postedDate: '2 วันที่แล้ว',
      matchScore: 85,
      tags: ['React', 'TypeScript', 'CSS', 'JavaScript', 'Vue.js'],
      applicants: 15,
      views: 234,
      deadline: '30 มิถุนายน 2568',
      description: 'เราเป็นบริษัทเทคโนโลยีชั้นนำที่กำลังมองหานักพัฒนา Frontend ที่มีความสามารถและมีประสบการณ์ในการพัฒนาเว็บแอปพลิเคชันที่ทันสมัย ร่วมงานกับทีมที่มีประสบการณ์และสร้างผลิตภัณฑ์ที่ส่งผลกระทบต่อผู้ใช้หลายล้านคน',
      responsibilities: [
        'พัฒนาและดูแลเว็บแอปพลิเคชันส่วน Frontend ด้วย React และ Vue.js',
        'ทำงานร่วมกับทีมดีไซน์และทีม Backend เพื่อสร้างประสบการณ์ผู้ใช้ที่ดี',
        'เขียนโค้ดที่มีคุณภาพและทำการทดสอบระบบอย่างสม่ำเสมอ',
        'ปรับปรุงประสิทธิภาพของเว็บไซต์และแก้ไขปัญหาที่เกิดขึ้น',
        'ร่วมในการวางแผนและพัฒนาฟีเจอร์ใหม่ๆ ตามความต้องการของผู้ใช้'
      ],
      requirements: [
        'ปริญญาตรีสาขาวิทยาการคอมพิวเตอร์ หรือสาขาที่เกี่ยวข้อง',
        'ประสบการณ์ในการพัฒนา Frontend 2-4 ปี',
        'มีความเชี่ยวชาญใน React, Vue.js, TypeScript และ JavaScript',
        'มีประสบการณ์ในการใช้ CSS Framework เช่น Tailwind CSS',
        'เข้าใจหลักการ Responsive Design และ Mobile-First Development',
        'มีประสบการณ์ในการใช้ Git และการทำงานเป็นทีม'
      ],
      welfare: [
        'เงินเดือนแข่งขันได้ + โบนัสประจำปี',
        'ประกันสุขภาพและประกันชีวิต',
        'วันหยุดพักผ่อนประจำปี 15 วัน',
        'งบสำหรับการเรียนรู้และพัฒนาทักษะ 20,000 บาท/ปี',
        'อุปกรณ์ทำงานครบครัน (MacBook, Monitor)',
        'สิทธิ์ทำงานจากบ้าน (Work from Home) 2 วัน/สัปดาห์'
      ],
      companyInfo: {
        name: 'TechCorp Thailand',
        description: 'เราเป็นบริษัทเทคโนโลยีชั้นนำที่มีประสบการณ์ยาวนานในการพัฒนาโซลูชันเทคโนโลยีสำหรับธุรกิจต่างๆ',
        address: 'กรุงเทพมหานคร',
        phone: '02-123-4567',
        email: 'careers@techcorp.co.th'
      }
    }
    isLoading.value = false
  }, 1500)
}

// ฟังก์ชันสำหรับเพิ่ม/ลบงานที่ชื่นชอบ
const toggleFavorite = () => {
  isFavorite.value = !isFavorite.value
  // ในเวอร์ชันจริงจะมีการบันทึกลงฐานข้อมูล
  console.log('Favorite toggled:', isFavorite.value)
}

// ฟังก์ชันสำหรับการสมัครงาน
const applyForJob = () => {
  // ในเวอร์ชันจริงจะมีการส่งข้อมูลไปยังเซิร์ฟเวอร์
  alert('🎉 ระบบได้รับการสมัครงานของคุณแล้ว! เราจะติดต่อกลับภายใน 3-5 วันทำการ')
}

// ฟังก์ชันสำหรับแชร์งาน
const shareJob = () => {
  // ในเวอร์ชันจริงจะมีการเปิด dialog สำหรับแชร์
  if (navigator.share) {
    navigator.share({
      title: job.value?.title,
      text: `ตำแหน่ง ${job.value?.title} ที่ ${job.value?.company}`,
      url: window.location.href
    })
  } else {
    // Fallback สำหรับ browser ที่ไม่รองรับ
    navigator.clipboard.writeText(window.location.href)
    alert('📋 คัดลอก URL สำหรับแชร์แล้ว!')
  }
}

// เรียกใช้ฟังก์ชันเมื่อโหลดหน้า
onMounted(() => {
  fetchJobDetails()
})
</script>

<style scoped>
/* Animation keyframes */
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

@keyframes gradient {
  0%, 100% {
    background-size: 200% 200%;
    background-position: left center;
  }
  50% {
    background-size: 200% 200%;
    background-position: right center;
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

.animation-delay-6000 {
  animation-delay: 6s;
}

.animation-delay-1000 {
  animation-delay: 1s;
}

.animate-gradient {
  background-size: 200% 200%;
  animation: gradient 3s ease infinite;
}

/* Glassmorphism effects */
.backdrop-blur-md {
  backdrop-filter: blur(12px);
}

.backdrop-blur-sm {
  backdrop-filter: blur(4px);
}

/* Custom scrollbar */
::-webkit-scrollbar {
  width: 8px;
}

::-webkit-scrollbar-track {
  background: rgba(255, 255, 255, 0.1);
  border-radius: 4px;
}

::-webkit-scrollbar-thumb {
  background: rgba(255, 255, 255, 0.3);
  border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
  background: rgba(255, 255, 255, 0.5);
}
</style>