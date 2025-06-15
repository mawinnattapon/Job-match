<template>
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
          <div class="flex items-center gap-4">
            <button @click="$router.back()" class="text-white hover:text-green-200 transition-colors">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
              </svg>
            </button>
            <h1 class="text-3xl font-bold text-white">ลงประกาศงาน</h1>
          </div>
          <div class="bg-gradient-to-r from-green-400 to-yellow-400 text-green-900 px-4 py-2 rounded-full font-bold text-sm">
            สำหรับบริษัท
          </div>
        </div>
      </div>
    </div>
    
    <!-- Content -->
    <div class="relative z-10 max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Success Message -->
      <div v-if="showSuccess" class="bg-green-500/20 backdrop-blur-sm border border-green-300/30 rounded-xl p-4 mb-6 fade-in">
        <div class="flex items-center">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-300 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <p class="text-green-100 font-medium">ลงประกาศงานเรียบร้อยแล้ว! งานของคุณจะปรากฏในระบบภายใน 24 ชั่วโมง</p>
        </div>
      </div>

      <!-- Job Posting Form -->
      <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
        <form @submit.prevent="submitJob" class="space-y-8">
          <!-- Basic Information -->
          <div class="space-y-6">
            <h2 class="text-2xl font-bold text-white mb-6">ข้อมูลพื้นฐาน</h2>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label class="block text-sm font-medium text-white mb-2">ชื่อตำแหน่งงาน *</label>
                <input 
                  v-model="jobForm.title" 
                  type="text" 
                  required
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                  placeholder="เช่น Frontend Developer"
                >
              </div>
              
              <div>
                <label class="block text-sm font-medium text-white mb-2">บริษัท *</label>
                <input 
                  v-model="jobForm.company" 
                  type="text" 
                  required
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                  placeholder="ชื่อบริษัท"
                >
              </div>
              
              <div>
                <label class="block text-sm font-medium text-white mb-2">ประเภทงาน *</label>
                <select 
                  v-model="jobForm.type" 
                  required
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-green-400"
                >
                  <option value="">เลือกประเภทงาน</option>
                  <option value="full-time">งานประจำ (Full-time)</option>
                  <option value="part-time">งานพาร์ทไทม์ (Part-time)</option>
                  <option value="contract">งานสัญญาจ้าง (Contract)</option>
                  <option value="freelance">งานฟรีแลนซ์ (Freelance)</option>
                  <option value="internship">งานฝึกงาน (Internship)</option>
                </select>
              </div>
              
              <div>
                <label class="block text-sm font-medium text-white mb-2">สถานที่ทำงาน *</label>
                <select 
                  v-model="jobForm.location" 
                  required
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-green-400"
                >
                  <option value="">เลือกสถานที่</option>
                  <option value="กรุงเทพมหานคร">กรุงเทพมหานคร</option>
                  <option value="นนทบุรี">นนทบุรี</option>
                  <option value="ปทุมธานี">ปทุมธานี</option>
                  <option value="สมุทรปราการ">สมุทรปราการ</option>
                  <option value="เชียงใหม่">เชียงใหม่</option>
                  <option value="ขอนแก่น">ขอนแก่น</option>
                  <option value="สงขลา">สงขลา</option>
                  <option value="remote">ทำงานจากที่บ้าน (Remote)</option>
                  <option value="hybrid">แบบผสม (Hybrid)</option>
                </select>
              </div>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label class="block text-sm font-medium text-white mb-2">เงินเดือน (บาท/เดือน)</label>
                <div class="grid grid-cols-2 gap-3">
                  <input 
                    v-model="jobForm.salaryMin" 
                    type="number" 
                    min="0"
                    class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                    placeholder="ต่ำสุด"
                  >
                  <input 
                    v-model="jobForm.salaryMax" 
                    type="number" 
                    min="0"
                    class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                    placeholder="สูงสุด"
                  >
                </div>
              </div>
              
              <div>
                <label class="block text-sm font-medium text-white mb-2">ประสบการณ์ที่ต้องการ</label>
                <select 
                  v-model="jobForm.experience" 
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-green-400"
                >
                  <option value="">ไม่ระบุ</option>
                  <option value="0">ไม่ต้องมีประสบการณ์</option>
                  <option value="1">1 ปี</option>
                  <option value="2">2 ปี</option>
                  <option value="3">3 ปี</option>
                  <option value="5">5 ปีขึ้นไป</option>
                  <option value="10">10 ปีขึ้นไป</option>
                </select>
              </div>
            </div>
          </div>

          <!-- Job Description -->
          <div class="space-y-6">
            <h2 class="text-2xl font-bold text-white mb-6">รายละเอียดงาน</h2>
            
            <div>
              <label class="block text-sm font-medium text-white mb-2">คำอธิบายงาน *</label>
              <textarea 
                v-model="jobForm.description" 
                rows="6" 
                required
                class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                placeholder="อธิบายรายละเอียดงาน หน้าที่ความรับผิดชอบ และสิ่งที่คาดหวังจากผู้สมัคร"
              ></textarea>
            </div>
            
            <div>
              <label class="block text-sm font-medium text-white mb-2">คุณสมบัติผู้สมัคร *</label>
              <textarea 
                v-model="jobForm.requirements" 
                rows="4" 
                required
                class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                placeholder="ระบุคุณสมบัติ ทักษะ และประสบการณ์ที่ต้องการ"
              ></textarea>
            </div>
            
            <div>
              <label class="block text-sm font-medium text-white mb-2">สวัสดิการ</label>
              <textarea 
                v-model="jobForm.benefits" 
                rows="3" 
                class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                placeholder="ระบุสวัสดิการและข้อดีที่บริษัทมอบให้"
              ></textarea>
            </div>
          </div>

          <!-- Skills and Tags -->
          <div class="space-y-6">
            <h2 class="text-2xl font-bold text-white mb-6">ทักษะและแท็ก</h2>
            
            <div>
              <label class="block text-sm font-medium text-white mb-2">ทักษะที่ต้องการ (คั่นด้วยเครื่องหมายจุลภาค)</label>
              <input 
                v-model="skillsText" 
                type="text" 
                class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                placeholder="JavaScript, Vue.js, Node.js, MySQL"
              >
              <div v-if="skillsPreview.length > 0" class="mt-3 flex flex-wrap gap-2">
                <span v-for="skill in skillsPreview" :key="skill" 
                  class="px-3 py-1 bg-green-500/20 backdrop-blur-sm border border-green-300/30 rounded-full text-sm text-green-100">
                  {{ skill }}
                </span>
              </div>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label class="block text-sm font-medium text-white mb-2">วันที่ปิดรับสมัคร</label>
                <input 
                  v-model="jobForm.deadline" 
                  type="date" 
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-green-400"
                >
              </div>
              
              <div class="flex items-center">
                <label class="flex items-center text-white">
                  <input 
                    v-model="jobForm.isUrgent" 
                    type="checkbox" 
                    class="mr-3 w-5 h-5 text-green-600 bg-white/20 border-white/30 rounded focus:ring-green-500"
                  >
                  <span class="text-sm font-medium">งานเร่งด่วน</span>
                </label>
              </div>
            </div>
          </div>

          <!-- Contact Information -->
          <div class="space-y-6">
            <h2 class="text-2xl font-bold text-white mb-6">ข้อมูลติดต่อ</h2>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label class="block text-sm font-medium text-white mb-2">ชื่อผู้ติดต่อ *</label>
                <input 
                  v-model="jobForm.contactName" 
                  type="text" 
                  required
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                  placeholder="ชื่อ HR หรือผู้ที่รับผิดชอบ"
                >
              </div>
              
              <div>
                <label class="block text-sm font-medium text-white mb-2">อีเมลติดต่อ *</label>
                <input 
                  v-model="jobForm.contactEmail" 
                  type="email" 
                  required
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                  placeholder="hr@company.com"
                >
              </div>
              
              <div>
                <label class="block text-sm font-medium text-white mb-2">เบอร์โทรติดต่อ</label>
                <input 
                  v-model="jobForm.contactPhone" 
                  type="tel" 
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                  placeholder="02-xxx-xxxx"
                >
              </div>
              
              <div>
                <label class="block text-sm font-medium text-white mb-2">เว็บไซต์บริษัท</label>
                <input 
                  v-model="jobForm.website" 
                  type="url" 
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"
                  placeholder="https://company.com"
                >
              </div>
            </div>
          </div>

          <!-- Submit Buttons -->
          <div class="flex flex-col sm:flex-row gap-4 pt-6">
            <button 
              type="submit" 
              :disabled="isSubmitting"
              class="flex-1 bg-gradient-to-r from-green-400 to-yellow-400 hover:from-green-500 hover:to-yellow-500 disabled:from-gray-400 disabled:to-gray-500 text-green-900 font-bold py-4 px-8 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg disabled:transform-none disabled:cursor-not-allowed flex items-center justify-center gap-2"
            >
              <svg v-if="isSubmitting" class="animate-spin h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              {{ isSubmitting ? 'กำลังลงประกาศ...' : 'ลงประกาศงาน' }}
            </button>
            
            <button 
              type="button" 
              @click="resetForm"
              class="bg-white/20 backdrop-blur-sm border border-white/30 text-white hover:bg-white/30 font-medium py-4 px-8 rounded-xl transition-all duration-300"
            >
              ล้างข้อมูล
            </button>
          </div>
        </form>
      </div>

      <!-- Preview Section -->
      <div v-if="showPreview" class="mt-8 bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
        <h2 class="text-2xl font-bold text-white mb-6">ตัวอย่างการแสดงผล</h2>
        <div class="bg-white/5 backdrop-blur-sm rounded-xl p-6 border border-white/10">
          <div class="flex justify-between items-start mb-4">
            <div>
              <h3 class="text-xl font-bold text-white">{{ jobForm.title || 'ชื่อตำแหน่งงาน' }}</h3>
              <p class="text-green-200">{{ jobForm.company || 'ชื่อบริษัท' }}</p>
            </div>
            <div v-if="jobForm.isUrgent" class="bg-red-500/20 backdrop-blur-sm border border-red-300/30 text-red-200 px-3 py-1 rounded-full text-sm font-medium">
              เร่งด่วน
            </div>
          </div>
          
          <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4 text-sm">
            <div class="text-green-100">
              <span class="text-white font-medium">ประเภท:</span> {{ jobForm.type || '-' }}
            </div>
            <div class="text-green-100">
              <span class="text-white font-medium">สถานที่:</span> {{ jobForm.location || '-' }}
            </div>
            <div class="text-green-100">
              <span class="text-white font-medium">เงินเดือน:</span> 
              {{ jobForm.salaryMin && jobForm.salaryMax ? `${Number(jobForm.salaryMin).toLocaleString()}-${Number(jobForm.salaryMax).toLocaleString()} บาท` : '-' }}
            </div>
            <div class="text-green-100">
              <span class="text-white font-medium">ประสบการณ์:</span> {{ jobForm.experience ? jobForm.experience + ' ปี' : '-' }}
            </div>
          </div>
          
          <div v-if="skillsPreview.length > 0" class="flex flex-wrap gap-2 mb-4">
            <span v-for="skill in skillsPreview" :key="skill" 
              class="px-2 py-1 bg-green-500/20 backdrop-blur-sm border border-green-300/30 rounded-full text-xs text-green-100">
              {{ skill }}
            </span>
          </div>
          
          <p class="text-green-100 text-sm">{{ jobForm.description || 'คำอธิบายงาน...' }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, watch } from 'vue'

// ตัวแปรสำหรับฟอร์ม
const jobForm = reactive({
  title: '',
  company: '',
  type: '',
  location: '',
  salaryMin: '',
  salaryMax: '',
  experience: '',
  description: '',
  requirements: '',
  benefits: '',
  deadline: '',
  isUrgent: false,
  contactName: '',
  contactEmail: '',
  contactPhone: '',
  website: ''
})

// ตัวแปรสำหรับทักษะ
const skillsText = ref('')
const skillsPreview = computed(() => {
  return skillsText.value
    .split(',')
    .map(skill => skill.trim())
    .filter(skill => skill.length > 0)
})

// ตัวแปรสำหรับสถานะ
const isSubmitting = ref(false)
const showSuccess = ref(false)
const showPreview = ref(false)

// เฝ้าดูการเปลี่ยนแปลงของฟอร์มเพื่อแสดงตัวอย่าง
watch([jobForm, skillsText], () => {
  showPreview.value = !!(jobForm.title || jobForm.company || jobForm.description)
}, { deep: true })

// ฟังก์ชันสำหรับส่งข้อมูลงาน
const submitJob = async () => {
  isSubmitting.value = true
  
  try {
    // จำลองการส่งข้อมูลไปยัง API
    await new Promise(resolve => setTimeout(resolve, 2000))
    
    // สร้างข้อมูลงานที่สมบูรณ์
    const jobData = {
      ...jobForm,
      skills: skillsPreview.value,
      postedDate: new Date().toISOString(),
      id: Date.now().toString()
    }
    
    console.log('Job posted:', jobData)
    
    // แสดงข้อความสำเร็จ
    showSuccess.value = true
    setTimeout(() => {
      showSuccess.value = false
    }, 5000)
    
    // รีเซ็ตฟอร์ม
    resetForm()
    
  } catch (error) {
    console.error('Error posting job:', error)
    alert('เกิดข้อผิดพลาดในการลงประกาศงาน กรุณาลองใหม่อีกครั้ง')
  } finally {
    isSubmitting.value = false
  }
}

// ฟังก์ชันสำหรับรีเซ็ตฟอร์ม
const resetForm = () => {
  Object.keys(jobForm).forEach(key => {
    if (key === 'isUrgent') {
      jobForm[key] = false
    } else {
      jobForm[key] = ''
    }
  })
  skillsText.value = ''
  showPreview.value = false
}

// ตั้งค่าวันที่ขั้นต่ำเป็นวันนี้
const today = new Date().toISOString().split('T')[0]
jobForm.deadline = today
</script>

<style scoped>
/* Blob Animations */
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

.animation-delay-6000 {
  animation-delay: 6s;
}

.animation-delay-1000 {
  animation-delay: 1s;
}

/* Glassmorphism Effects */
.backdrop-blur-md {
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
}

.backdrop-blur-sm {
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
}

/* Fade In Animation */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.fade-in {
  animation: fadeIn 0.6s ease-out;
}

/* Form Styling */
select option {
  background-color: #1f2937;
  color: white;
}

input[type="date"]::-webkit-calendar-picker-indicator {
  filter: invert(1);
}

/* Checkbox Styling */
input[type="checkbox"] {
  accent-color: #22c55e;
}
</style>
